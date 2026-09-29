from argparse import ArgumentParser
from json import JSONDecodeError, loads
from pathlib import Path
from sys import stderr


VALID_STATUSES = {"planned", "prototype", "implemented"}


def load_json(path: Path):
    try:
        return loads(path.read_text(encoding="utf-8"))
    except (OSError, JSONDecodeError) as error:
        raise ValueError(f"cannot read {path}: {error}") from error


def read_qmldir(path: Path):
    public_types = {}
    all_types = {}

    for line_number, raw_line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        line = raw_line.strip()
        if not line or line.startswith(("#", "module ", "import ", "prefer ")):
            continue

        fields = line.split()
        internal = fields[0] == "internal"
        if internal:
            if len(fields) != 3:
                raise ValueError(
                    f"{path}:{line_number}: invalid internal type registration")
            name = fields[1]
        else:
            if len(fields) != 3:
                continue
            name = fields[0]
            public_types.setdefault(name, []).append(line_number)

        all_types.setdefault(name, []).append(line_number)

    return public_types, all_types


def validate_entry(entry, controls_directory: Path):
    errors = []
    tracked = False
    name = entry.get("name")
    if not name:
        return None, tracked, ["every control entry must have a name"]

    status = entry.get("status")
    if status not in VALID_STATUSES:
        errors.append(f"{name}: invalid status {status!r}")
    if status == "planned":
        return name, tracked, errors

    qml_file = entry.get("qml")
    if not qml_file:
        errors.append(f"{name}: {status} entries must declare qml")
    elif not (controls_directory / qml_file).is_file():
        errors.append(f"{name}: missing QML file {qml_file}")
    else:
        tracked = True

    style_name = entry.get("style")
    if style_name and not (controls_directory / "styles" / f"{style_name}.qml").is_file():
        errors.append(f"{name}: missing style file styles/{style_name}.qml")

    return name, tracked, errors


def validate_entries(entries, controls_directory: Path):
    errors = []
    names = set()
    tracked_exports = set()

    for entry in entries:
        name, tracked, entry_errors = validate_entry(entry, controls_directory)
        errors.extend(entry_errors)
        if name is None:
            continue
        if name in names:
            errors.append(f"duplicate manifest entry: {name}")
        names.add(name)
        if tracked:
            tracked_exports.add(name)

    return tracked_exports, errors


def validate_registrations(controls_directory: Path, tracked_exports):
    errors = []
    qmldir_path = controls_directory / "qmldir"
    try:
        public_types, all_types = read_qmldir(qmldir_path)
    except (OSError, ValueError) as error:
        errors.append(str(error))
        return errors

    for name, lines in all_types.items():
        if len(lines) > 1:
            errors.append(
                f"qmldir registers {name} more than once on lines {lines}")

    for name in sorted(tracked_exports - public_types.keys()):
        errors.append(
            f"{name}: prototype is not publicly registered in qmldir")

    for name in sorted(public_types.keys() - tracked_exports):
        errors.append(f"qmldir publicly registers untracked type {name}")

    return errors


def validate_style_registrations(controls_directory: Path, entries):
    errors = []
    tracked_styles = {
        entry["style"]
        for entry in entries
        if entry.get("status") != "planned" and entry.get("style")
    }

    qmldir_path = controls_directory / "styles" / "qmldir"
    try:
        public_types, all_types = read_qmldir(qmldir_path)
    except (OSError, ValueError) as error:
        return [str(error)]

    for name, lines in all_types.items():
        if len(lines) > 1:
            errors.append(
                f"styles qmldir registers {name} more than once on lines {lines}")

    for name in sorted(tracked_styles - public_types.keys()):
        errors.append(f"{name}: style is not publicly registered in qmldir")

    return errors


def validate(manifest_path: Path, controls_directory: Path):
    manifest = load_json(manifest_path)
    errors = []

    if manifest.get("schemaVersion") != 1:
        errors.append("schemaVersion must be 1")

    entries = manifest.get("controls", []) + manifest.get("extensions", [])
    tracked_exports, entry_errors = validate_entries(
        entries, controls_directory)
    errors.extend(entry_errors)
    errors.extend(validate_registrations(controls_directory, tracked_exports))
    errors.extend(validate_style_registrations(controls_directory, entries))
    return errors


def main():
    parser = ArgumentParser(
        description="Validate Qameleon's control coverage manifest")
    parser.add_argument("manifest", type=Path)
    parser.add_argument("controls_directory", type=Path)
    arguments = parser.parse_args()

    errors = validate(arguments.manifest, arguments.controls_directory)
    if errors:
        for error in errors:
            print(f"error: {error}", file=stderr)
        return 1

    print("Control manifest is valid")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

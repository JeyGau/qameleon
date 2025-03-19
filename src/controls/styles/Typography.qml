import QtQuick 2.15
import org.qameleon.controls.theming 1.0

QtObject {
    property color color: ThemeManager.theme.textColor
    property font font: Qt.font({
        "family": ThemeManager.theme.fontFamily
    })
}

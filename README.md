# qameleon
## Overview

Qameleon is a versatile GUI library designed to simplify the creation of user interfaces for various applications. It provides a range of customizable components and tools to enhance the user experience.

## Features

- **Customizable Components**: Easily modify components to fit your design needs.
- **Responsive Design**: Ensure your application looks great on any device.
- **Theming Support**: Apply different themes to match your application's style.
- **Accessibility**: Built with accessibility in mind to reach a wider audience.

## Installation

To install Qameleon, use the following command:

```bash
mkdir -p build
cd build
cmake ..
make
sudo make install
```

## Usage

Here's a basic example of how to use Qameleon in your project:

```javascript
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import qameleon.controls 1.0 as Qameleon
import QtQuick.Controls.Material 2.15

Page {
    title: "Test Button"

    ScrollView {
        anchors.centerIn: parent

        ColumnLayout {

            Qameleon.Button {
                // uses default style from your theme
                Layout.alignment: Qt.AlignHCenter
                text: "Default style"
            }

            Qameleon.Button {
                Layout.alignment: Qt.AlignHCenter
                style {
                    normal {
                        typography.color: Material.color(Material.Red, Material.Shade900)
                        background {
                            color: Material.color(Material.Red)
                            border {

                                color: Material.color(Material.Red, Material.Shade900)
                            }
                        }
                    }

                    hovered {
                        typography.color: Material.color(Material.Red, Material.Shade900)
                        background {
                            color: Material.color(Material.Red)
                            border {

                                color: Material.color(Material.Red, Material.Shade900)
                            }
                        }
                    }

                    pressed {
                        typography.color: Material.color(Material.Red, Material.Shade200)
                        background {
                            color: Material.color(Material.Red, Material.Shade100)
                            border {
                                color: Material.color(Material.Red, Material.Shade200)
                            }
                        }
                    }
                }
                text: "Custom style"
            }

        }

    }
}
```

## Runtime themes and style properties

Controls read default radius and elevation values from the active theme. The
theme object can be replaced or edited at runtime and existing controls update
immediately:

```qml
import org.qameleon.controls.theming 1.0

AbstractTheme {
    id: elevatedTheme
    borderRadius: 12
    elevation: 8
}

Button {
    text: "Use elevated theme"
    onClicked: ThemeManager.theme = elevatedTheme
}
```

Values assigned directly to a control style take precedence and stop following
the corresponding theme default:

```qml
Qameleon.Button {
    style.background.radius: 2
    style.background.dropShadow.elevation: 0
}
```

The planned style-module attached-property API will support inherited overrides
with syntax such as:

```qml
Item {
    MyStyle.elevation: 8
    MyStyle.radius: 12
}
```

Descendant controls will inherit these values unless a nearer ancestor or the
control's local style overrides them. The precedence contract is:

1. Local control style property.
2. Nearest inherited style-module attached property.
3. Active theme property.
4. Qameleon built-in default.

Attached properties require a registered style-specific provider and are not yet
implemented by the QML-only `MyStyle` example.

## License

Qameleon is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
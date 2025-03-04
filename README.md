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

## License

Qameleon is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
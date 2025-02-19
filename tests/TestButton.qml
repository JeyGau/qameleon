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




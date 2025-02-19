import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import qameleon.controls 1.0 as Qameleon
import qameleon.controls.styles 1.0
import QtQuick.Controls.Material 2.15

Page {
    title: "Test Label"

    ScrollView {
        anchors.centerIn: parent

        ColumnLayout {

            Qameleon.Label {
                text: "Default style"
            }

            Qameleon.Label {
                style {
                    typography {
                        color: Material.color(Material.Green)
                        font.pixelSize: 20
                    }
                    background {
                        color: Material.color(Material.Green, Material.Shade200)
                        border {
                            color: Material.color(Material.Green)
                        }
                        radius: 5
                    }
                }
                
                text: "Custom style"
            }
        }
    }
}


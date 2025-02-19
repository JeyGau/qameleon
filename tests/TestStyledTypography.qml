import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import qameleon.controls.typographies.scales 1.0 as Scales
import qameleon.controls.typographies 1.0 as Label
import QtQuick.Controls.Material 2.15

Page {
    title: "Test Styled Typography"


    ColumnLayout {

        Label.Headline1 {
            text: "Headline1"
            style {
                background {
                    border {
                        color: Material.color(Material.Green)
                    }
                    color: Material.color(Material.Green, Material.Shade200)
                    radius: 5
                }
            }
        }

        Label.Headline1 {
            text: "Headline1"
        }

        Label.Body1 {
            text: "Body1"
        }

        Label.Body1 {
            text: "Body1"
            color: Material.color(Material.Green)
        }
    }

}


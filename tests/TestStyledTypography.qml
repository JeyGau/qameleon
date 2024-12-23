import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import qameleon.controls.typographies.scales 1.0 as Scales
import qameleon.controls.typographies 1.0 as Label

Page {
    title: "Test Styled Typography"

    onVisibleChanged: {
        Scales.Body1.color = visible ? "red" : "black";
    }

    ColumnLayout {

        Label.Headline1 {
            text: "Headline1"
            style {
                background {
                    border {
                        color: "green"
                        width: 3
                    }
                    color: "lightgreen"
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
            color: "blue"
        }
    }

}


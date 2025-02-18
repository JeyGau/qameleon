import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import qameleon.controls 1.0 as Qameleon
import qameleon.controls.styles 1.0

Page {
    title: "Test Label"

    ScrollView {
        anchors.fill: parent

        ColumnLayout {

            Qameleon.Label {
                style {
                    typography {
                        color: "red"
                        font.pixelSize: 20
                    }
                    background {
                        color: "lightgreen"
                        border {
                            color: "green"
                            width: 3
                        }
                        radius: 5
                    }
                }
                topPadding: 10
                leftPadding: 20
                rightPadding: 30
                bottomPadding: 40
                
                text: "Test"
            }
        }
    }
}


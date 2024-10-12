import QtQuick 2.15
import QtQuick.Controls 2.15
import qameleon.controls 2.15 as Qameleon
import "theme" as Theme

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    background: Rectangle {
        color: "lightgray"
    }


    Qameleon.Button {
        id: button
        text: "Hello, World!"
        anchors.centerIn: parent
        style: Theme.CustomButtonStyle {
        }
        height: 120
        width: 240
    }
}
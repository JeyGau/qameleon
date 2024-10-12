import QtQuick 2.15
import QtQuick.Controls 2.15
import qameleon.controls 2.15 as Qameleon
import qameleon.theming 1.0
import "theme"

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    background: Rectangle {
        color: "lightgray"
    }

    Theme {
        id: theme
    }


    Qameleon.Button {
        id: button
        text: "Hello, World!"
        anchors.centerIn: parent
        onClicked: ThemeManager.theme = theme
        height: 120
        width: 240
    }
}
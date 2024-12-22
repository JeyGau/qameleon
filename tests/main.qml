import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import QtQuick.Layouts 1.15
import qameleon.controls 2.15
import qameleon.controls.typographies 1.0
import qameleon.controls.theming 1.0
import "theme"

QQC2.ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    background: Rectangle {
        color: "lightgray"
    }

    palette.button: "red"

    QQC2.Popup {
        id: popup
        width: 400
        height: 400
        modal: true
        visible: false
        palette.button: "green"
        QQC2.Button {
            text: "Close"
            anchors.centerIn: parent
            onClicked: popup.close()
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        Headline1 {
            Layout.fillWidth: true
            text: "Headline1"
        }

        Headline2 {
            Layout.fillWidth: true
            text: "Headline2"
        }

        Headline3 {
            Layout.fillWidth: true
            text: "Headline3"
        }

        Headline4 {
            Layout.fillWidth: true
            text: "Headline4"
        }

        Headline5 {
            Layout.fillWidth: true
            text: "Headline5"
        }

        Headline6 {
            Layout.fillWidth: true
            text: "Headline6"
        }

    }

}
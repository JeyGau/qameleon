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
    height: 800
    title: qsTr("Hello World")

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        Headline1 {
            Layout.fillHeight: true
            text: "Headline1"
        }

        Headline2 {
            Layout.fillHeight: true
            text: "Headline2"
        }

        Headline3 {           
            Layout.fillHeight: true
            text: "Headline3"
        }

        Headline4 {            
            Layout.fillHeight: true
            text: "Headline4"
        }

        Headline5 {           
            Layout.fillHeight: true
            text: "Headline5"
        }

        Headline6 {            
            Layout.fillHeight: true
            text: "Headline6"
        }

        Subtitle1 {
            Layout.fillHeight: true
            text: "Subtitle1"
        }

        Subtitle2 {
            Layout.fillHeight: true
            text: "Subtitle2"
        }

        Body1 {
            Layout.fillHeight: true
            text: "Body1"
        }

        Body2 {
            Layout.fillHeight: true
            text: "Body2"
        }

        Caption {
            Layout.fillHeight: true
            text: "Caption"
        }

        Overline {
            Layout.fillHeight: true
            text: "Overline"
        }

    }

}
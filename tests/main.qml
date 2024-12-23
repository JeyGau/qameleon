import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import qameleon.controls 1.0 as Controls

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: stackLayout.children[stackLayout.currentIndex].title

    StackLayout {
        id: stackLayout

        anchors.fill: parent
        clip: true

        TestTypographies {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        TestStyledTypography {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        TestButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        TestLabel {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    footer: RowLayout {
        height: 60
        width: parent.width
        Button {
            Layout.leftMargin: 10
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.preferredHeight: 40
            enabled: stackLayout.currentIndex > 0
            text: "Previous"
            onClicked: stackLayout.currentIndex = stackLayout.currentIndex - 1
        }

        Button {
            Layout.rightMargin: 10
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.preferredHeight: 40
            enabled: stackLayout.currentIndex < stackLayout.count - 1
            text: "Next"
            onClicked: stackLayout.currentIndex = stackLayout.currentIndex + 1
        }
    }
    
    
}
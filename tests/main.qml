import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import qameleon.controls 1.0 as Qameleon
import qameleon.controls.theming 1.0 as Qameleon
import "./theme"

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: stackLayout.children[stackLayout.currentIndex].title

    Theme {
        id: mainTheme
    }

    Component.onCompleted: {
        Qameleon.ThemeManager.theme = mainTheme;
    }

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

    footer: Qameleon.ActionsButtonBox {
        height: 60

        horizontalPadding: 30

        ActionGroup {

            Qameleon.Action {
                text: "Previous"
                enabled: stackLayout.currentIndex > 0
                onTriggered: stackLayout.currentIndex = stackLayout.currentIndex - 1
                role: Qameleon.ActionsButtonBox.Role.Secondary
            }

            Qameleon.Action {
                text: "Next"
                enabled: stackLayout.currentIndex < stackLayout.count - 1
                onTriggered: stackLayout.currentIndex = stackLayout.currentIndex + 1
                role: Qameleon.ActionsButtonBox.Role.Primary
            }

        }

    }
    
}
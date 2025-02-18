import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import qameleon.controls.styles 1.0

QQC2.Button {
    id: control

    property ButtonStyle style: ButtonStyle {}

    readonly property ButtonStyle.StatedStyle activeStyle: {
        if (!control.enabled) {
            return control.style.disabled
        }

        if (control.pressed) {
            return control.style.pressed
        } 

        if (control.hovered) {
            return control.style.hovered
        }

        return control.style.normal
    }

    background: Rectangle {
        color: control.activeStyle.background.color
        border.color: control.activeStyle.background.border.color
        border.width: control.activeStyle.background.border.width
        radius: control.activeStyle.background.radius
    }

    contentItem: Label {
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        text: control.text
        typography: control.activeStyle.typography
    }
}
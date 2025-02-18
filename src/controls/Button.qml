import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import qameleon.controls.styles 1.0

QQC2.Button {
    id: control

    property ButtonStyle style: ButtonStyle {}

    background: Rectangle {
        color: control.style.background.color
        border.color: control.style.background.border.color
        border.width: control.style.background.border.width
        radius: control.style.background.radius
    }

    contentItem: Label {
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        text: control.text
        typography: control.style.typography
    }
}
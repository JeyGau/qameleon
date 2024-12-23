import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import qameleon.controls.styles 1.0

QQC2.Control {
    id: control

    property ControlStyle style: ControlStyle {}

    background: Rectangle {
        color: control.style.background.color
        border.color: control.style.background.border.color
        border.width: control.style.background.border.width
        radius: control.style.background.radius
    }
}
import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import qameleon.controls.styles 1.0

QQC2.Label {
    id: control

    property LabelStyle style: LabelStyle {}
    property Typography typography: style.typography

    color: control.typography.color
    font: control.typography.font

    background: Rectangle {
        color: control.style.background.color
        border.color: control.style.background.border.color
        border.width: control.style.background.border.width
        radius: control.style.background.radius
    }
}
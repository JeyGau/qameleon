import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import qameleon.controls.styles 1.0

QQC2.Label {
    id: control

    property LabelStyle style: LabelStyle {}

    color: control.style.color
    font: control.style.font
    horizontalAlignment: control.style.horizontalAlignment
    verticalAlignment: control.style.verticalAlignment
    wrapMode: control.style.wrapMode
    elide: control.style.elide
    text: control.text

    background: Rectangle {
        color: control.style.background.color
        border.color: control.style.background.border.color
        border.width: control.style.background.border.width
        radius: control.style.background.radius
    }
}
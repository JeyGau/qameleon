import QtQuick 2.15
import qameleon.controls.styles 1.0

Text {
    id: control

    property LabelStyle style: LabelStyle {}

    color: control.style.color
    font: control.style.font
    horizontalAlignment: control.style.horizontalAlignment
    verticalAlignment: control.style.verticalAlignment
    wrapMode: control.style.wrapMode
    elide: control.style.elide
    text: control.text
}
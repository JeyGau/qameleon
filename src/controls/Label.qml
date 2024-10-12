import QtQuick 2.15
import qameleon.styles 1.0

Text {
    id: control

    property LabelStyle style: LabelStyle {}

    color: control.style.color
    font.family: control.style.font.family
    font.pixelSize: control.style.font.pixelSize
    font.bold: control.style.font.bold
    font.italic: control.style.font.italic
    font.underline: control.style.font.underline
    font.strikeout: control.style.font.strikeout
    horizontalAlignment: control.style.horizontalAlignment
    verticalAlignment: control.style.verticalAlignment
    wrapMode: control.style.wrapMode
    elide: control.style.elide
    text: control.text
    leftPadding: control.style.padding.left
    rightPadding: control.style.padding.right
    topPadding: control.style.padding.top
    bottomPadding: control.style.padding.bottom
}
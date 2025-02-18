import QtQuick 2.15
import qameleon.styles 1.0

Text {
    id: control

    property LabelStyle style: LabelStyle {}

    color: control.style.color
    font: control.style.font
}
import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import qameleon.controls.styles 1.0
import "private" as P

QQC2.Label {
    id: control

    property LabelStyle style: LabelStyle {}
    property Typography typography: style.typography

    color: control.typography.color
    font: control.typography.font

    background: P.Background {
        style: control.style.background
    }
}
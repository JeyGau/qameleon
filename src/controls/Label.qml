import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import org.qameleon.controls.styles 1.0
import "private" as P

QQC2.Label {
    id: control

    property LabelStyle style
    property Typography typography: style.typography

    color: control.typography.color
    font: control.typography.font

    style: LabelStyle {
    }

    background: P.Background {
        style: control.style.background
    }

}

import QtQuick.Controls as QQC2
import org.qameleon.controls.styles
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

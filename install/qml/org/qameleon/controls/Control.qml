import QtQuick.Controls as QQC2
import org.qameleon.controls.styles
import "private" as P

QQC2.Control {
    id: control

    property ControlStyle style: ControlStyle {}

    background: P.Background {
        style: control.style.background
    }
}

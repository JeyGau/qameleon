import QtQuick.Controls 2.15 as QQC2
import org.qameleon.controls.styles 1.0
import "private" as P

QQC2.Control {
    id: control

    property ControlStyle style

    style: ControlStyle {
    }

    background: P.Background {
        style: control.style.background
    }

}

import QtQuick.Controls as T
import org.qameleon.controls.styles
import "private" as P

T.Control {
    id: control

    property ControlStyle style: ControlStyle {}

    background: P.Background {
        style: control.style.background
    }
}

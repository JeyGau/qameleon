import QtQml
import QtQuick.Templates as T
import org.qameleon.controls.styles
import "private" as P

T.Control {
    id: control

    property ControlStyle style: ControlStyle {}

    Binding {
        when: control.style
        target: control.style
        property: "control"
        value: control
    }

    background: P.Background {
        style: control.style.background
    }
}

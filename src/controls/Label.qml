import QtQml
import QtQuick.Templates as T
import org.qameleon.controls.styles
import "private" as P

T.Label {
    id: control

    property LabelStyle style: LabelStyle {}
    property Typography typography: style.typography

    Binding {
        when: control.style
        target: control.style
        property: "control"
        value: control
    }

    color: control.typography.color
    font: control.typography.font
    horizontalAlignment: control.typography.horizontalAlignment
    verticalAlignment: control.typography.verticalAlignment

    background: P.Background {
        style: control.style.background
    }
}

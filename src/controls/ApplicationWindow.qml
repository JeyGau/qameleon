import QtQml
import QtQuick.Templates as T
import org.qameleon.controls.styles
import "private" as P

T.ApplicationWindow {
    id: control

    property PageStyle style: PageStyle {}

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

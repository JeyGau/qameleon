import QtQuick.Templates as T
import org.qameleon.controls.styles
import org.qameleon.controls

T.ApplicationWindow {
    id: control

    property PageStyle style: PageStyle {}

    background: Background {
        style: control.style.background
    }
}

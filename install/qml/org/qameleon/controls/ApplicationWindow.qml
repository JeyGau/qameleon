import QtQuick.Templates as T
import org.qameleon.controls.styles
import "private" as P

T.ApplicationWindow {
    id: control

    property PageStyle style: PageStyle {}

    background: P.Background {
        style: control.style.background
    }
}

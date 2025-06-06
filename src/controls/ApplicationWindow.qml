import QtQuick.Controls as QQC2
import org.qameleon.controls.styles
import "private" as P

QQC2.ApplicationWindow {
    id: control

    property PageStyle style: PageStyle {}

    background: P.Background {
        style: control.style.background
    }
}

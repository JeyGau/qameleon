import QtQml
import QtQuick
import QtQuick.Templates as T
import org.qameleon.controls.styles
import "private" as P

T.DelayButton {
    id: control

    property DelayButtonStyle style

    padding: 6

    Binding {
        when: control.style
        target: control.style
        property: "control"
        value: control
    }

    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding)

    transition: Transition {
        NumberAnimation {
            duration: control.delay * (control.pressed ? 1.0 - control.progress : 0.3 * control.progress)
        }
    }

    style: DelayButtonStyle {}

    contentItem: Label {
        text: control.text
        style: control.style.label
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.leftPadding
        rightPadding: control.rightPadding
    }

    background: P.Background {
        style: control.style.background
        width: control.width
        height: control.height
        
        P.Background {
            objectName: "delayProgressFill"
            width: Math.max(0, Math.min(parent.width, control.progress * parent.width))
            height: parent.height
            style: control.style.progressBackground
        }
    }
}
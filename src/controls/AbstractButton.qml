import QtQml
import QtQuick.Templates as T
import org.qameleon.controls.styles
import "private" as P

T.AbstractButton {
    id: control

    property AbstractButtonStyle style: AbstractButtonStyle {}

    Binding {
        when: control.style
        target: control.style
        property: "control"
        value: control
    }

    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding)

    background: P.Background {
        style: control.style.background
    }

    contentItem: Label {
        style: control.style.label
        text: control.text
    }
}
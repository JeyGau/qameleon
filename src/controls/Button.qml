import QtQuick
import QtQuick.Templates as T
import org.qameleon.controls.styles
import org.qameleon.controls

T.Button {
    id: control

    property ButtonStyle style: ButtonStyle {}

    Binding {
        when: control.style
        target: control.style
        property: "__control"
        value: control
    }

    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding)

    background: Background {
        style: control.style.background
    }

    contentItem: Label {
        style: control.style.labelStyle
        text: control.text
    }
}

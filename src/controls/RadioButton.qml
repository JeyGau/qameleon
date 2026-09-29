import QtQml
import QtQuick
import QtQuick.Templates as T
import org.qameleon.controls.styles
import "private" as P

T.RadioButton {
    id: control

    property RadioButtonStyle style

    padding: 6
    spacing: 6

    Binding {
        when: control.style
        target: control.style
        property: "control"
        value: control
    }

    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, indicator.height + topPadding + bottomPadding, implicitContentHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding + spacing + indicator.width)

    indicator: Item {
        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        width: control.style.indicator.background.implicitWidth
        height: control.style.indicator.background.implicitHeight

        Rectangle {
            anchors.fill: parent
            color: control.checked || control.down ? control.style.indicator.background.color : "transparent"
            radius: control.style.indicator.background.radius
            border.color: control.style.indicator.background.border.color
            border.width: control.style.indicator.background.border.width + (control.activeFocus ? 1 : 0)
        }

        Rectangle {
            anchors.centerIn: parent
            width: Math.max(0, Math.min(parent.width, parent.height) * 0.5)
            height: width
            radius: width / 2
            color: control.style.indicator.typography.color
            visible: control.checked
        }
    }

    style: RadioButtonStyle {}

    contentItem: Label {
        text: control.text
        style: control.style.label
        leftPadding: control.mirrored ? 0 : control.indicator.width + control.spacing
        rightPadding: control.mirrored ? control.indicator.width + control.spacing : 0
    }

    background: P.Background {
        style: control.style.background
    }
}
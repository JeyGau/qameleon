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

    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, indicator.implicitHeight + topPadding + bottomPadding, implicitContentHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding + spacing + indicator.implicitWidth)

    indicator: P.Background {
        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        style: control.style.indicator

        P.Background {
            objectName: "radioTick"
            anchors.centerIn: parent
            width: Math.max(0, Math.min(control.style.tick.implicitWidth, parent.width))
            height: Math.max(0, Math.min(control.style.tick.implicitHeight, parent.height))
            style: control.style.tick
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
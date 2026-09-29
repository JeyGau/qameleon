import QtQml
import QtQuick.Controls.impl
import QtQuick.Templates as T
import org.qameleon.controls.styles
import "private" as P

T.ToolButton {
    id: control

    property ToolButtonStyle style: ToolButtonStyle {}

    padding: 6
    spacing: 6

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

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        icon: control.icon
        text: control.text
        font: control.font
        color: control.style.label.typography.color
    }
}
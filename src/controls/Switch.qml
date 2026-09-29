import QtQml
import QtQuick
import QtQuick.Templates as T
import org.qameleon.controls.styles
import "private" as P

T.Switch {
    id: control

    property SwitchStyle style

    padding: 6
    spacing: 8

    Binding {
        when: control.style
        target: control.style
        property: "control"
        value: control
    }

    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, indicator.implicitHeight + topPadding + bottomPadding, implicitContentHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, indicator.implicitWidth + implicitContentWidth + spacing + leftPadding + rightPadding)

    indicator: Label {
        id: indicatorItem
        objectName: "switchTrack"

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        style: LabelStyle {
            background: control.style.indicator
        }

        width: control.style.indicator.implicitWidth
        height: control.style.indicator.implicitHeight

        P.Background {
            id: thumb
            objectName: "switchThumb"

            x: Math.max(indicatorItem.leftPadding, Math.min(indicatorItem.width - width - indicatorItem.rightPadding, indicatorItem.leftPadding + control.visualPosition * (indicatorItem.width - width / 2 - indicatorItem.leftPadding - indicatorItem.rightPadding)))
            y: (indicatorItem.height - height) / 2
            width: control.style.thumb.implicitWidth
            height: control.style.thumb.implicitHeight
            style: control.style.thumb
            border.width: control.style.thumb.border.width + (control.activeFocus ? 1 : 0)
        }
    }

    style: SwitchStyle {}

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
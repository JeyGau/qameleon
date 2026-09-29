import org.qameleon.controls.styles
import QtQml
import QtQuick.Templates as T
import "private" as P

T.CheckBox {
    id: control

    property CheckBoxStyle style

    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, indicator.height + topPadding + bottomPadding, implicitContentHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, leftPadding + rightPadding + implicitContentWidth + spacing)

    Binding {
        when: control.style
        target: control.style
        property: "__control"
        value: control
    }

    indicator: Label {
        x: {
            if (control.mirrored)
                return control.width - width;
            return control.leftPadding;
        }
        y: (control.height - height) / 2

        width: control.style.indicator.background.implicitWidth
        height: control.style.indicator.background.implicitHeight
        style: control.style.indicator
        text: "\u2713"
    }

    style: CheckBoxStyle {}

    contentItem: Label {
        text: control.text
        style: control.style.label
        leftPadding: {
            if (control.mirrored)
                return 0;
            return control.indicator.width + control.spacing;
        }
        rightPadding: {
            if (control.mirrored)
                return control.indicator.width + control.spacing;
            return 0;
        }
    }

    background: P.Background {
        style: control.style.background
    }
}

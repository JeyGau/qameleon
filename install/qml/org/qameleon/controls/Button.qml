import QtQuick
import QtQuick.Templates as T
import org.qameleon.controls.styles
import "private" as P

T.Button {
    id: control

    property ButtonStyle style: ButtonStyle {}

    onStyleChanged: {
        if (style)
            style.__control = control;
    }

    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding)

    background: P.Background {
        style: control.style.background
    }

    contentItem: Text {
        horizontalAlignment: control.style.typography.horizontalAlignment
        verticalAlignment: control.style.typography.verticalAlignment
        text: control.text
        color: control.style.typography.color
        font: control.style.typography.font
    }
}

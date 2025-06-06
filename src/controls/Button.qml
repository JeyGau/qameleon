import QtQuick
import QtQuick.Controls as QQC2
import org.qameleon.controls.styles
import "private" as P

QQC2.Button {
    id: control

    property ButtonStyle style: ButtonStyle {}

    readonly property ButtonStyle.StatedStyle activeStyle: {
        if (!control.enabled)
            return control.style.disabled;

        if (control.down)
            return control.style.pressed;

        if (control.hovered)
            return control.style.hovered;

        return control.style.normal;
    }

    background: P.Background {
        style: control.activeStyle.background
    }

    contentItem: Text {
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        text: control.text
        color: control.activeStyle.typography.color
        font: control.activeStyle.typography.font
    }
}

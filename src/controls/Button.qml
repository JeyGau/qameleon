import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import org.qameleon.controls.styles 1.0
import "private" as P

QQC2.Button {
    id: control

    property ButtonStyle style

    style: ButtonStyle {
    }

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

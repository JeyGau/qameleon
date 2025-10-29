import QtQuick
import QtQuick.Templates as QQC2
import org.qameleon.controls.styles
import "private" as P

QQC2.Button {
    id: control

    property ButtonStyle style: ButtonStyle {}

    StyleEngine.control: control
    StyleEngine.style: style

    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding)

    background: P.Background {
        style: StyleEngine.activeStyle.background
    }

    contentItem: Text {
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        text: control.text
        color: StyleEngine.activeStyle.typography.color
        font: StyleEngine.activeStyle.typography.font
    }
}

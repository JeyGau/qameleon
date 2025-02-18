
import qameleon.controls.styles 1.0
import QtGraphicalEffects 1.12
import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2

QQC2.Button {
    id: button

    property ButtonStyle buttonStyle: ButtonStyle {}

    implicitWidth: textMetrics.width + leftPadding + rightPadding
    implicitHeight: textMetrics.height + topPadding + bottomPadding

    TextMetrics {
        id: textMetrics

        text: button.text
        font: buttonStyle.font
    }

    background: Rectangle {
        color: {
            if (button.down)
                return buttonStyle.backgroundColorDown;

            if (button.checked)
                return buttonStyle.backgroundColorChecked;

            return buttonStyle.backgroundColor;
        }
        border.color: button.down ? buttonStyle.borderColorDown : buttonStyle.borderColor
        border.width: buttonStyle.borderWidth
        radius: buttonStyle.radius
        layer.enabled: buttonStyle.dropShadowEnabled

        layer.effect: DropShadow {
            horizontalOffset: 0
            verticalOffset: 3
            radius: 10
            samples: 17
            color: HMIConstants.shadowsColor
        }

    }

    contentItem: Text {
        clip: true
        text: button.text
        color: button.checked || button.down ? buttonStyle.textColorDown : buttonStyle.textColor
        font: buttonStyle.font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
    }

}

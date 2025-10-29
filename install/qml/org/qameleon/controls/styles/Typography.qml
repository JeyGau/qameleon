import QtQuick
import org.qameleon.controls.theming

QtObject {
    property color color: ThemeManager.theme.textColor
    property font font: Qt.font({
        "family": ThemeManager.theme.fontFamily
    })
    property int horizontalAlignment: Text.AlignHCenter
    property int verticalAlignment: Text.AlignVCenter
}

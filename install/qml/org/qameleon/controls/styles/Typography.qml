import QtQuick
import org.qameleon.controls.theming

QtObject {
    property color color: ThemeManager.theme.textColor
    property font font: Qt.font({
        "family": ThemeManager.theme.fontFamily
    })
}

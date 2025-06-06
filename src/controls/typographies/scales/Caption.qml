import QtQuick
import org.qameleon.controls.styles
import org.qameleon.controls.theming

Typography {
    id: headline1

    color: "black"
    font: Qt.font({
        "family": ThemeManager.theme.fontFamily,
        "pixelSize": 12,
        "weight": Font.Regular,
        "letterSpacing": 0.4
    })
}

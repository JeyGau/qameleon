import QtQuick
import org.qameleon.controls.styles
import org.qameleon.controls.theming

Typography {
    id: headline2

    color: "black"
    font: Qt.font({
        "family": ThemeManager.theme.fontFamily,
        "pixelSize": 60,
        "weight": Font.Light,
        "letterSpacing": -0.5
    })
}

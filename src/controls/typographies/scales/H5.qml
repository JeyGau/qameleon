import QtQuick
import org.qameleon.controls.styles
import org.qameleon.controls.theming

Typography {
    id: headline5

    color: "black"
    font: Qt.font({
        "family": ThemeManager.theme.fontFamily,
        "pixelSize": 24,
        "weight": Font.Normal,
        "letterSpacing": 0
    })
}

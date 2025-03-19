import QtQuick 2.15
import org.qameleon.controls.styles 1.0
import org.qameleon.controls.theming 1.0

Typography {
    id: headline3

    color: "black"
    font: Qt.font({
        "family": ThemeManager.theme.fontFamily,
        "pixelSize": 48,
        "weight": Font.Normal,
        "letterSpacing": 0
    })
}

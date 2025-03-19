import QtQuick 2.15
import org.qameleon.controls.styles 1.0
import org.qameleon.controls.theming 1.0

Typography {
    id: headline1

    color: "black"
    font: Qt.font({
        "family": ThemeManager.theme.fontFamily,
        "pixelSize": 96,
        "weight": Font.Light,
        "letterSpacing": -1.5
    })
}

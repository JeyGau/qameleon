import QtQuick 2.15
import org.qameleon.controls.styles 1.0
import org.qameleon.controls.theming 1.0

Typography {
    id: headline4

    color: "black"
    font: Qt.font({
        "family": ThemeManager.theme.fontFamily,
        "pixelSize": 34,
        "weight": Font.Normal,
        "letterSpacing": 0.25
    })
}

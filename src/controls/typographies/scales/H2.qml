import QtQuick 2.15
import org.qameleon.controls.styles 1.0
pragma Singleton

Typography {
    id: headline2

    color: "black"
    font: Qt.font({
        "family": "Roboto",
        "pixelSize": 60,
        "weight": Font.Light,
        "letterSpacing": -0.5
    })
}

import QtQuick 2.15
import org.qameleon.controls.styles 1.0
pragma Singleton

Typography {
    id: headline1

    color: "black"
    font: Qt.font({
        "family": "Roboto",
        "pixelSize": 12,
        "weight": Font.Regular,
        "letterSpacing": 0.4
    })
}

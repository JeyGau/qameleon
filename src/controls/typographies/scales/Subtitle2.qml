import QtQuick 2.15
import org.qameleon.controls.styles 1.0
pragma Singleton

Typography {
    id: headline1

    color: "black"
    font: Qt.font({
        "family": "Roboto",
        "pixelSize": 14,
        "weight": Font.Medium,
        "letterSpacing": 0.1
    })
}

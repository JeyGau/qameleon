import QtQuick 2.15
import org.qameleon.controls.styles 1.0
pragma Singleton

Typography {
    id: headline6

    color: "black"
    font: Qt.font({
        "family": "Roboto",
        "pixelSize": 20,
        "weight": Font.Medium,
        "letterSpacing": 0.15
    })
}

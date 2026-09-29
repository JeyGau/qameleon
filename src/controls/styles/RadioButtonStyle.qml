AbstractButtonStyle {
    property Background indicator: Background {
        color: "transparent"
        implicitWidth: 24
        implicitHeight: 24
        radius: 12

        border {
            color: "#667a75"
            width: control && control.activeFocus ? 2 : 1
        }
    }

    property Background tick: Background {
        color: control && control.checked ? "#087f6d" : "transparent"
        implicitWidth: 12
        implicitHeight: 12
        radius: 6
    }
}
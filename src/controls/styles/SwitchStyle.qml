import "private" as P
AbstractButtonStyle {
    property P.Background indicator: P.Background {
        color: "#c5d1ce"
        implicitWidth: 48
        implicitHeight: 28
        radius: 14

        border {
            color: "#9aa9a5"
            width: 1
        }
    }
    

    property P.Background thumb: P.Background {
        color: "#ffffff"
        implicitWidth: 22
        implicitHeight: 22
        radius: 11

        border {
            color: "#84938f"
            width: 1
        }
    }
    
}
import QtQml

QtObject {
    property int implicitWidth: 0
    property int implicitHeight: 0
    property color color: "transparent"
    property int radius: 0
    property Border border
    property real opacity: 1

    border: Border {
        color: "transparent"
        width: 0
    }
}

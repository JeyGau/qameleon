import QtQuick

QtObject {
    property color color: "black"
    property font font: Qt.font({
        "family": "Arial"
    })
    property int horizontalAlignment: Text.AlignHCenter
    property int verticalAlignment: Text.AlignVCenter
}

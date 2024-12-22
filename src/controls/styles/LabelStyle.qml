import QtQuick 2.15
import QtQuick.Controls 2.15
import "private" as P

QtObject{
    property color color: palette.text
    property font font: Qt.font({family: "Arial"})
    property var horizontalAlignment: Qt.AlignLeft
    property var verticalAlignment: Qt.AlignVCenter
    property var wrapMode: Text.NoWrap
    property var elide: Text.ElideNone
}
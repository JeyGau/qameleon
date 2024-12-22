import QtQml 2.15
import QtQuick.Controls 2.15
import "private" as P

QtObject {
    property Button control
    property P.Background background: P.Background {color: palette.button}
    property LabelStyle label: LabelStyle {horizontalAlignment: Qt.AlignHCenter; font: control.font}
    property P.Padding padding: P.Padding {}
}
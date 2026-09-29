import QtQml
import org.qameleon.controls.theming

QtObject {
    property int implicitWidth: 0
    property int implicitHeight: 0
    property color color: "transparent"
    property int radius: ThemeManager.theme.borderRadius
    property real elevation: ThemeManager.theme.elevation
    property Border border: Border {}
    property real opacity: 1
    property DropShadow dropShadow: DropShadow {}
}

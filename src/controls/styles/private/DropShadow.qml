import QtQml
import org.qameleon.controls.theming

QtObject {
    property real elevation: ThemeManager.theme.elevation
    property bool enabled: elevation > 0
    property color color: "#40000000"
    property real xOffset: elevation > 0 ? 0 : 3
    property real yOffset: elevation > 0 ? Math.max(1, elevation / 2) : 3
    property real radius: elevation > 0 ? Math.max(1, elevation * 2) : 8
}

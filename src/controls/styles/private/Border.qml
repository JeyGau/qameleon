import QtQml
import org.qameleon.controls.theming

QtObject {
    property color color: ThemeManager.theme.backgroundColor
    property int width: ThemeManager.theme.borderWidth
}

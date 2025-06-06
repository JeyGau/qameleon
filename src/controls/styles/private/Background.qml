import QtQml
import org.qameleon.controls.theming

QtObject {
    property color color: ThemeManager.theme.backgroundColor
    property int radius: ThemeManager.theme.borderRadius
    property Border border

    border: Border {}
}

import QtQml 2.15
import org.qameleon.controls.theming 1.0

QtObject {
    property color color: ThemeManager.theme.backgroundColor
    property int radius: ThemeManager.theme.borderRadius
    property Border border

    border: Border {
    }

}

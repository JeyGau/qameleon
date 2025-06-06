import QtQml
import org.qameleon.controls.theming

ControlStyle {
    property ButtonStyle primaryButtonStyle: ButtonStyle {}

    property ButtonStyle secondaryButtonStyle: ButtonStyle {}

    property int preferredButtonWidth: 120
    background {
        color: ThemeManager.theme.viewColor
        border.width: 0
    }
}

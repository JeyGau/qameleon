import QtQml 2.15
import qameleon.controls.theming 1.0

ControlStyle {
    property ButtonStyle primaryButtonStyle: ButtonStyle {}
    property ButtonStyle secondaryButtonStyle:  ButtonStyle {}

    property int preferredButtonWidth: 120

    background {
        color: ThemeManager.theme.viewColor
        border.width: 0
    }
}

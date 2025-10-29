import org.qameleon.controls.theming

ControlStyle {
    property ButtonStyle primaryButtonStyle: ButtonStyle {}
    property ButtonStyle secondaryButtonStyle: ButtonStyle {}

    background {
        color: ThemeManager.theme.viewColor
        border.width: 0
    }
}

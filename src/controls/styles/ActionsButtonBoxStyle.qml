import QtQml 2.15
import org.qameleon.controls.theming 1.0

ControlStyle {
    property ButtonStyle primaryButtonStyle

    primaryButtonStyle: ButtonStyle {
    }

    property ButtonStyle secondaryButtonStyle

    secondaryButtonStyle: ButtonStyle {
    }

    property int preferredButtonWidth: 120
    background {
        color: ThemeManager.theme.viewColor
        border.width: 0
    }

}

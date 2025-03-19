import QtQml 2.15
import org.qameleon.controls.theming 1.0

ControlStyle {
    property StatedStyle normal

    normal: StatedStyle {
        typography.color: ThemeManager.theme.normal.textColor

        background {
            color: ThemeManager.theme.normal.backgroundColor

            border {
                color: ThemeManager.theme.normal.borderColor
            }

        }

    }

    property StatedStyle disabled

    disabled: StatedStyle {
        typography.color: ThemeManager.theme.disabled.textColor

        background {
            color: ThemeManager.theme.disabled.backgroundColor

            border {
                color: ThemeManager.theme.disabled.borderColor
            }

        }

    }

    property StatedStyle pressed

    pressed: StatedStyle {
        typography.color: ThemeManager.theme.pressed.textColor

        background {
            color: ThemeManager.theme.pressed.backgroundColor

            border {
                color: ThemeManager.theme.pressed.borderColor
            }

        }

    }

    property StatedStyle hovered

    hovered: StatedStyle {
        typography.color: ThemeManager.theme.hovered.textColor

        background {
            color: ThemeManager.theme.hovered.backgroundColor

            border {
                color: ThemeManager.theme.hovered.borderColor
            }

        }

    }

    component StatedStyle: LabelStyle {
    }

}

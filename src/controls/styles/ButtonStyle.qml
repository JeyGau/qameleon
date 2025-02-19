import QtQml 2.15
import qameleon.controls.theming 1.0

ControlStyle {

    component StatedStyle: LabelStyle {}

    property StatedStyle normal: StatedStyle {
        typography.color: ThemeManager.theme.normal.textColor
        background {
            color: ThemeManager.theme.normal.backgroundColor
            border {
                color: ThemeManager.theme.normal.borderColor
            }
        }
    }
    property StatedStyle disabled: StatedStyle {
        typography.color: ThemeManager.theme.disabled.textColor
        background {
            color: ThemeManager.theme.disabled.backgroundColor
            border {
                color: ThemeManager.theme.disabled.borderColor
            }
        }
    }
    property StatedStyle pressed: StatedStyle {
        typography.color: ThemeManager.theme.pressed.textColor
        background {
            color: ThemeManager.theme.pressed.backgroundColor
            border {
                color: ThemeManager.theme.pressed.borderColor
            }
        }
    }
    property StatedStyle hovered: StatedStyle {
        typography.color: ThemeManager.theme.hovered.textColor
        background {
            color: ThemeManager.theme.hovered.backgroundColor
            border {
                color: ThemeManager.theme.hovered.borderColor
            }
        }
    }

}
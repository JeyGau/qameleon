import QtQml 2.15
import QtQuick.Controls.Material 2.15

QtObject {
    id: theme

    component ColorSet: QtObject {
        property color backgroundColor: theme.backgroundColor
        property color textColor: theme.textColor
        property color borderColor: theme.backgroundColor
    }

    property ColorSet normal: ColorSet {
    }

    property ColorSet disabled: ColorSet {
    }

    property ColorSet pressed: ColorSet {
    }

    property ColorSet hovered: ColorSet {
    }

    property ColorSet focused: ColorSet {
    }

    property ColorSet checked: ColorSet {
    }

    property ColorSet highlighted: ColorSet {
    }

    property ColorSet error: ColorSet {
    }


    property int borderWidth: 1
    property int borderRadius: 2

    property color primaryColor: Material.color(Material.Blue)
    property color secondaryColor: Material.color(Material.LightBlue)

    property color textColor: Material.foreground
    property color disabledTextColor: Material.color(Material.Grey)
    property color placeholderColor: Material.color(Material.Grey)
    property color hintColor: Material.color(Material.Grey)

    property color backgroundColor: Material.background
    property color disabledBackgroundColor: Material.color(Material.Grey)

    property color highlightColor: Material.accent
    property color errorColor: Material.color(Material.Red)
    property color successColor: Material.color(Material.Green)
    property color warningColor: Material.color(Material.Orange)
    property color infoColor: Material.color(Material.BlueGrey)

    property color linkColor: Material.color(Material.Blue)
    property color linkHoverColor: Material.color(Material.BlueGrey)
    property color linkVisitedColor: Material.color(Material.Purple)
    property color linkActiveColor: Material.color(Material.Blue)
    property color linkDisabledColor: Material.color(Material.Grey)
}
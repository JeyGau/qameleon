import QtQml 2.15

ControlStyle {

    component StatedStyle: LabelStyle {}

    property StatedStyle normal: StatedStyle {
        typography.color: "black"
        background.color: "lightgray"
    }
    property StatedStyle disabled: StatedStyle {
        typography.color: "gray"
        background.color: "lightgray"
    }
    property StatedStyle pressed: StatedStyle {
        typography.color: "white"
        background.color: "darkgray"
    }
    property StatedStyle hovered: StatedStyle {
        typography.color: "black"
        background.color: "lightgray"
    }

}
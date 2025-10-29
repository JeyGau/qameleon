import QtQml
import org.qameleon.controls.theming

Style {
    component AbstractButtonStyle: AbstractStyle {
        property Typography typography: Typography {}
    }

    _default: AbstractButtonStyle {}

    property var _disabled: AbstractButtonStyle {
        background.border {
            width: 3
            color: "red"
        }
    }
}

import QtQml 2.15
import QtQuick.Controls 2.15
import "private" as P

QtObject {
    id: root

    component ButtonState: QtObject {
        required property string name
        property P.Background background: P.Background {}
        property LabelStyle label: LabelStyle {}
    } 

    property list<ButtonState> states: [
        ButtonState {
            name: "normal"
            background: P.Background {
                color: "blue"
            }
            label: LabelStyle {
                color: "white"
            }
        },
        ButtonState {
            name: "hovered"
            background: P.Background {
                color: "red"
            }
            label: LabelStyle {
                color: "white"
            }
        },
        ButtonState {
            name: "pressed"
            background: P.Background {
                color: "green"
            }
            label: LabelStyle {
                color: "white"
            }
        },
        ButtonState {
            name: "disabled"
            background: P.Background {
                color: "gray"
            }
            label: LabelStyle {
                color: "white"
            }
        },
        ButtonState {
            name: "checked"
            background: P.Background {
                color: "yellow"
            }
            label: LabelStyle {
                color: "white"
            }
        }
    ]
}

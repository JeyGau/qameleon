import QtQml

QtObject {
    id: style

    property QtObject control: null
    property alias __control: style.control
    property Background background: Background {}
}

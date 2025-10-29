import QtQuick

Rectangle {
    property Background style: Background {}

    color: style.color
    border.color: style.border.color
    border.width: style.border.width
    radius: style.radius
}

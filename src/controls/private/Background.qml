import QtQuick
import "../styles/private" as S

Rectangle {
    property S.Background style: S.Background {}

    color: style.color
    border.color: style.border.color
    border.width: style.border.width
    radius: style.radius
    opacity: style.opacity
    implicitWidth: style.implicitWidth
    implicitHeight: style.implicitHeight
}

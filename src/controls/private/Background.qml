import QtQuick
import Qt5Compat.GraphicalEffects
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

    layer.enabled: style.dropShadow.enabled

    layer.effect: DropShadow {
        horizontalOffset: style.dropShadow.xOffset
        verticalOffset: style.dropShadow.yOffset
        radius: style.dropShadow.radius
        color: style.dropShadow.color
    }
}

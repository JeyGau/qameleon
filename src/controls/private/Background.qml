import QtQuick
import Qt5Compat.GraphicalEffects
import "../styles/private" as S

Rectangle {
    id: background

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
        cached: true
        color: background.style.dropShadow.color
        horizontalOffset: background.style.dropShadow.xOffset
        radius: background.style.dropShadow.radius
        transparentBorder: true
        verticalOffset: background.style.dropShadow.yOffset
    }
}

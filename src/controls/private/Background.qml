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

    layer.enabled: style.dropShadow.enabled || style.elevation > 0

    layer.effect: DropShadow {
        horizontalOffset: style.dropShadow.enabled ? style.dropShadow.xOffset : 0
        verticalOffset: style.dropShadow.enabled ? style.dropShadow.yOffset : Math.max(1, style.elevation / 2)
        radius: style.dropShadow.enabled ? style.dropShadow.radius : style.elevation
        color: style.dropShadow.color
    }
}

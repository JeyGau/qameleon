import QtQuick 2.15
import "../styles/private" as P

Rectangle {
    property P.Background style: P.Background {}

    color: style.color
    border.color: style.border.color
    border.width: style.border.width
    radius: style.radius
}

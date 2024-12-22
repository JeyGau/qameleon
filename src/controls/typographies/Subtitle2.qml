import ".."
import qameleon.controls.typographies.scales 1.0 as Scales
import QtQuick 2.15

Item {
    id: headline1

    property alias text: label.text

    implicitWidth: label.implicitWidth
    implicitHeight: label.implicitHeight

    Label {
        id: label
        
        anchors.fill: parent
        style: Scales.Subtitle2
    }

}
import ".."
import qameleon.controls.typographies.styles 1.0
import QtQuick 2.15

Item {
    id: headline3

    property alias text: label.text

    implicitWidth: label.implicitWidth
    implicitHeight: label.implicitHeight
    
    Label {
        id: label
        
        anchors.fill: parent
        style: Headline3Style
    }

}
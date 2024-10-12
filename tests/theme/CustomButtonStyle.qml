import qameleon.styles 1.0 as QameleonStyles

QameleonStyles.ButtonStyle {
    background.color: control.down? "blue": "red"
    background.border.color: "blue"
    background.border.width: 1
    background.radius: 5
    label.padding.left: 10
    label.padding.right: 10
    label.padding.top: 5
    label.padding.bottom: 5
    label.color: "red"
    label.font.family: "Arial"
    label.font.pixelSize: 16
    label.font.bold: true
    label.font.italic: false
    label.font.underline: false
    label.font.strikeout: false
    label.horizontalAlignment: Qt.AlignHCenter
}
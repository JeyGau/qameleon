import QtQuick.Controls 2.15 as QQC2

QQC2.ApplicationWindow {
    id: window

    property alias viewFactory: applicationStackView.viewFactory
    readonly property ApplicationStackView applicationStackView: applicationStackView

    ApplicationStackView {
        id: applicationStackView

        anchors.fill: parent
    }

}

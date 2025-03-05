import qameleon.controls 1.0 as Qameleon

Qameleon.ApplicationWindow {
    id: window

    property alias viewFactory: applicationStackView.viewFactory

    ApplicationStackView {
        id: applicationStackView

        anchors.fill: parent
    }

}

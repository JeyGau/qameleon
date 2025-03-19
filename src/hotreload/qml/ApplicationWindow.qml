import org.qameleon.controls 1.0 as Qameleon

Qameleon.ApplicationWindow {
    id: window

    property alias viewFactory: applicationStackView.viewFactory
    readonly property ApplicationStackView applicationStackView: applicationStackView

    ApplicationStackView {
        id: applicationStackView

        anchors.fill: parent
    }

}

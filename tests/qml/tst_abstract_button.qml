import QtQuick 2.15
import QtTest 1.2
import org.qameleon.controls 1.0 as Qameleon
import org.qameleon.controls.styles 1.0 as Styles

Item {
    width: 200
    height: 100

    Qameleon.AbstractButton {
        id: abstractButton

        width: 120
        height: 40
        text: "Abstract button"
    }

    Styles.ButtonStyle {
        id: buttonStyle
    }

    TestCase {
        name: "AbstractButton"
        when: windowShown

        SignalSpy {
            id: clickedSpy
            target: abstractButton
            signalName: "clicked"
        }

        function init() {
            clickedSpy.clear();
        }

        function test_defaultContent() {
            compare(abstractButton.contentItem.text, abstractButton.text);
            compare(abstractButton.style.control, abstractButton);
            verify(abstractButton.background !== null);
            verify(buttonStyle.label !== null);
        }

        function test_click() {
            mouseClick(abstractButton, abstractButton.width / 2, abstractButton.height / 2);
            compare(clickedSpy.count, 1);
        }
    }
}
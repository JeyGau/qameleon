import QtQuick 2.15
import QtTest 1.2
import org.qameleon.controls 1.0 as Qameleon

Item {
    width: 320
    height: 160
    LayoutMirroring.enabled: true
    LayoutMirroring.childrenInherit: true

    Qameleon.RadioButton {
        id: firstOption
        text: "First"
        checked: true
    }

    Qameleon.RadioButton {
        id: secondOption
        y: 48
        text: "Second"
    }

    Qameleon.RadioButton {
        id: disabledOption
        y: 96
        text: "Disabled"
        enabled: false
    }

    TestCase {
        name: "RadioButton"
        when: windowShown

        function init() {
            firstOption.checked = true;
            secondOption.checked = false;
        }

        function test_defaultStyleAndIndicator() {
            compare(firstOption.style.control, firstOption);
            compare(firstOption.indicator.width, 24);
            compare(firstOption.indicator.height, 24);
            verify(firstOption.indicator.children[1].visible);
            verify(!secondOption.indicator.children[1].visible);
            compare(firstOption.contentItem.text, firstOption.text);
        }

        function test_autoExclusiveSiblingSelection() {
            mouseClick(secondOption, secondOption.width / 2, secondOption.height / 2);
            verify(secondOption.checked);
            verify(!firstOption.checked);
        }

        function test_mirroredIndicatorPosition() {
            firstOption.width = 180;
            tryCompare(firstOption.indicator, "x", firstOption.width - firstOption.indicator.width - firstOption.rightPadding);
        }

        function test_disabledOption() {
            verify(!disabledOption.enabled);
            verify(!disabledOption.checked);
        }
    }
}
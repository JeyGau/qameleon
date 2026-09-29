import QtQuick 2.15
import QtTest 1.2
import org.qameleon.controls 1.0 as Qameleon

Item {
    width: 320
    height: 180
    LayoutMirroring.enabled: true
    LayoutMirroring.childrenInherit: true

    Qameleon.Switch {
        id: switchControl
        text: "Wi-Fi"
    }

    TestCase {
        name: "Switch"
        when: windowShown

        function init() {
            switchControl.checked = false;
            switchControl.width = 160;
            switchControl.leftPadding = 6;
            switchControl.rightPadding = 6;
        }

        function test_styleAndTrackGeometry() {
            compare(switchControl.style.control, switchControl);
            compare(switchControl.indicator.width, 48);
            compare(switchControl.indicator.height, 28);
            compare(switchControl.contentItem.text, switchControl.text);
            compare(switchControl.indicator.style, switchControl.style.indicator);
            compare(switchControl.style.thumb.implicitWidth, 22);
        }

        function test_pointerTogglesCheckedState() {
            mouseClick(switchControl, switchControl.width / 2, switchControl.height / 2);
            verify(switchControl.checked);

            mouseClick(switchControl, switchControl.width / 2, switchControl.height / 2);
            verify(!switchControl.checked);
        }

        function test_keyboardTogglesCheckedState() {
            switchControl.forceActiveFocus();
            keyClick(Qt.Key_Space);
            verify(switchControl.checked);
        }

        function test_mirroredVisualPosition() {
            switchControl.checked = true;
            const thumb = findChild(switchControl, "switchThumb");
            const expectedX = Math.max(0, Math.min(switchControl.indicator.width - thumb.width, switchControl.visualPosition * switchControl.indicator.width - thumb.width / 2));
            tryCompare(thumb, "x", expectedX);
        }

        function test_trackAndThumbAreStyledBackgrounds() {
            const indicator = switchControl.indicator;
            const thumb = findChild(switchControl, "switchThumb");
            verify(thumb !== null);
            compare(indicator.objectName, "switchTrack");
            compare(indicator.color, switchControl.style.indicator.color);
            compare(thumb.style, switchControl.style.thumb);
            compare(thumb.color, switchControl.style.thumb.color);
        }
    }
}
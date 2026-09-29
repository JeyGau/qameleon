import QtQuick 2.15
import QtTest 1.2
import org.qameleon.controls 1.0 as Qameleon

Item {
    width: 240
    height: 100

    Qameleon.DelayButton {
        id: delayButton
        text: "Hold to confirm"
        delay: 3000
    }

    TestCase {
        name: "DelayButton"
        when: windowShown

        SignalSpy {
            id: activatedSpy
            target: delayButton
            signalName: "activated"
        }

        function init() {
            delayButton.progress = 0;
            activatedSpy.clear();
        }

        function test_styleAndProgressBackground() {
            const progressFill = findChild(delayButton, "delayProgressFill");
            compare(delayButton.style.control, delayButton);
            compare(delayButton.contentItem.text, delayButton.text);
            verify(progressFill !== null);
            compare(progressFill.style, delayButton.style.progressBackground);
            compare(progressFill.width, 0);
        }

        function test_holdAdvancesProgressAndActivates() {
            const progressFill = findChild(delayButton, "delayProgressFill");
            delayButton.delay = 500;
            mousePress(delayButton, delayButton.width / 2, delayButton.height / 2);
            wait(150);
            tryVerify(function() { return delayButton.progress > 0.1; }, 300);
            tryCompare(delayButton, "progress", 1, 900);
            tryCompare(activatedSpy, "count", 1, 200);
            compare(progressFill.width, delayButton.background.width);
            mouseRelease(delayButton, delayButton.width / 2, delayButton.height / 2);
        }

        function test_threeSecondDelayDoesNotCompleteImmediately() {
            delayButton.delay = 3000;
            mousePress(delayButton, delayButton.width / 2, delayButton.height / 2);
            wait(150);
            verify(delayButton.pressed);
            verify(delayButton.progress < 1);
            compare(activatedSpy.count, 0);
            mouseRelease(delayButton, delayButton.width / 2, delayButton.height / 2);

        }

        function test_progressControlsFillWidth() {
            const progressFill = findChild(delayButton, "delayProgressFill");
            delayButton.progress = 0.4;
            compare(progressFill.width, delayButton.background.width * 0.4);
        }
    }
}
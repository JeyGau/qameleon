import QtQuick 2.15
import QtTest 1.2
import org.qameleon.controls 1.0 as Qameleon
import org.qameleon.controls.styles 1.0 as Styles

Item {
    width: 200
    height: 100

    Qameleon.RoundButton {
        id: roundButton

        width: 80
        height: 60
        text: "Round"
    }

    Qameleon.RoundButton {
        id: customRoundButton

        style: Styles.RoundButtonStyle {
            background.radius: 8
        }
    }

    TestCase {
        name: "RoundButton"
        when: windowShown

        function test_defaultRadius() {
            compare(roundButton.style.control, roundButton);
            compare(roundButton.style.background.radius, roundButton.radius);
            compare(roundButton.background.radius, roundButton.radius);
            compare(roundButton.contentItem.text, roundButton.text);
        }

        function test_customRadius() {
            compare(customRoundButton.background.radius, 8);
        }
    }
}
import QtQuick 2.15
import QtTest 1.2
import org.qameleon.controls 1.0 as Qameleon
import org.qameleon.controls.styles 1.0 as Styles
import org.qameleon.controls.theming 1.0 as Theming

Item {
    width: 320
    height: 200

    Theming.AbstractTheme {
        id: lowTheme
        borderRadius: 4
        elevation: 2
    }

    Theming.AbstractTheme {
        id: highTheme
        borderRadius: 12
        elevation: 8
    }

    Qameleon.Button {
        id: themedButton
        text: "Themed"
    }

    Qameleon.Button {
        id: overriddenButton
        text: "Overridden"

        style: Styles.ButtonStyle {
            background.radius: 1
            background.elevation: 0
        }
    }

    TestCase {
        name: "RuntimeTheme"

        function init() {
            Theming.ThemeManager.theme = lowTheme;
        }

        function test_localOverridesWin() {
            compare(overriddenButton.style.background.radius, 1);
            compare(overriddenButton.style.background.elevation, 0);

            Theming.ThemeManager.theme = highTheme;

            compare(overriddenButton.style.background.radius, 1);
            compare(overriddenButton.style.background.elevation, 0);
        }

        function test_themeChangesApplyAtRuntime() {
            compare(themedButton.style.background.radius, 4);
            compare(themedButton.style.background.elevation, 2);
            compare(themedButton.background.radius, 4);
            verify(themedButton.background.layer.enabled);

            Theming.ThemeManager.theme = highTheme;

            compare(themedButton.style.background.radius, 12);
            compare(themedButton.style.background.elevation, 8);
            compare(themedButton.background.radius, 12);
        }
    }
}
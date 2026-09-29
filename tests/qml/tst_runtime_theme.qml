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
            background.dropShadow.elevation: 0
        }
    }

    Qameleon.Button {
        id: customShadowButton
        text: "Custom shadow"

        style: Styles.ButtonStyle {
            background.dropShadow.enabled: true
            background.dropShadow.radius: 12
            background.dropShadow.xOffset: 0
            background.dropShadow.yOffset: 4
        }
    }

    TestCase {
        name: "RuntimeTheme"

        function init() {
            Theming.ThemeManager.theme = lowTheme;
        }

        function test_localOverridesWin() {
            compare(overriddenButton.style.background.radius, 1);
            compare(overriddenButton.style.background.dropShadow.elevation, 0);
            verify(!overriddenButton.style.background.dropShadow.enabled);

            Theming.ThemeManager.theme = highTheme;

            compare(overriddenButton.style.background.radius, 1);
            compare(overriddenButton.style.background.dropShadow.elevation, 0);
            verify(!overriddenButton.style.background.dropShadow.enabled);
        }

        function test_customShadowFallback() {
            verify(customShadowButton.background.layer.enabled);
            verify(customShadowButton.style.background.dropShadow.enabled);
            compare(customShadowButton.style.background.dropShadow.radius, 12);
            compare(customShadowButton.style.background.dropShadow.xOffset, 0);
            compare(customShadowButton.style.background.dropShadow.yOffset, 4);
        }

        function test_themeChangesApplyAtRuntime() {
            compare(themedButton.style.background.radius, 4);
            compare(themedButton.style.background.dropShadow.elevation, 2);
            compare(themedButton.style.background.dropShadow.radius, 4);
            compare(themedButton.style.background.dropShadow.yOffset, 1);
            compare(themedButton.background.radius, 4);
            verify(themedButton.background.layer.enabled);

            Theming.ThemeManager.theme = highTheme;

            compare(themedButton.style.background.radius, 12);
            compare(themedButton.style.background.dropShadow.elevation, 8);
            compare(themedButton.style.background.dropShadow.radius, 16);
            compare(themedButton.style.background.dropShadow.yOffset, 4);
            compare(themedButton.background.radius, 12);
        }
    }
}
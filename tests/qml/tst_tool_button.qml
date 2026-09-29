import QtQuick 2.15
import QtTest 1.2
import org.qameleon.controls 1.0 as Qameleon
import org.qameleon.controls.styles 1.0 as Styles

Item {
    width: 240
    height: 120

    Qameleon.ToolButton {
        id: toolButton
        text: "Tools"
    }

    Qameleon.ToolButton {
        id: checkableToolButton
        text: checked ? "On" : "Off"
        checkable: true
    }

    TestCase {
        name: "ToolButton"
        when: windowShown

        function test_defaultStyleAndSizing() {
            compare(toolButton.style.control, toolButton);
            compare(toolButton.style.__control, toolButton);
            compare(toolButton.background.implicitWidth, 40);
            compare(toolButton.background.implicitHeight, 40);
            compare(toolButton.contentItem.text, toolButton.text);
        }

        function test_checkedInteraction() {
            mouseClick(checkableToolButton, checkableToolButton.width / 2, checkableToolButton.height / 2);
            verify(checkableToolButton.checked);
        }

        function test_styleOverride() {
            const custom = toolButton.style.background.color;
            toolButton.style.background.color = "#123456";
            compare(toolButton.background.color, "#123456");
            toolButton.style.background.color = custom;
        }
    }
}
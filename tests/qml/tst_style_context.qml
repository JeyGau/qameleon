import QtQuick 2.15
import QtTest 1.2
import org.qameleon.controls 1.0 as Qameleon
import org.qameleon.controls.styles 1.0 as Styles

TestCase {
    name: "StyleContext"

    Qameleon.Control {
        id: control
    }

    Qameleon.Button {
        id: button
    }

    Qameleon.CheckBox {
        id: checkBox
    }

    Qameleon.Label {
        id: label
    }

    Qameleon.Page {
        id: page
    }

    Qameleon.ActionsButtonBox {
        id: actionsButtonBox
        style: Styles.ActionsButtonBoxStyle {}
    }

    Component {
        id: applicationWindowComponent

        Qameleon.ApplicationWindow {
            visible: false
        }
    }

    function verifyStyleContext(item) {
        compare(item.style.control, item);
        compare(item.style.__control, item);
    }

    function test_contextBindings() {
        verifyStyleContext(control);
        verifyStyleContext(button);
        verifyStyleContext(checkBox);
        verifyStyleContext(label);
        verifyStyleContext(page);
        verifyStyleContext(actionsButtonBox);

        const applicationWindow = applicationWindowComponent.createObject(null);
        verify(applicationWindow !== null);
        verifyStyleContext(applicationWindow);
        applicationWindow.destroy();
    }
}
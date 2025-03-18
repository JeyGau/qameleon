// TODO: move this API to C++
// TODO: add an attached property to the viewFactory so that we can access ApplicationStackView from the ViewFactory

import QtQuick 2.15
import QtQuick.Templates 2.15 as T

T.Control {
    id: control

    required property var viewFactory
    property alias currentItem: stack.currentItem
    property alias replaceEnter: stack.replaceEnter
    property alias replaceExit: stack.replaceExit
    property alias pushEnter: stack.pushEnter
    property alias pushExit: stack.pushExit
    property alias popEnter: stack.popEnter
    property alias popExit: stack.popExit

    function replace(view, target, properties, operation) {
        var newView = viewFactory.get(view);
        if (newView) {
            stack.replace(target, newView, properties, operation);
            stack.viewsStacked[stack.viewsStacked.length - 1] = view;
        } else {
            console.error("Failed to replace view: " + view);
        }
    }

    function push(view, properties, operation) {
        var newView = viewFactory.get(view);
        if (newView) {
            stack.push(newView, properties, operation);
            stack.viewsStacked.push(view);
        } else {
            console.error("Failed to push view: " + view);
        }
    }

    function reload() {
        const views = stack.viewsStacked;
        clear();
        for (var i = 0; i < views.length; i++) {
            push(views[i]);
        }
    }

    function pop(view, operation) {
        if (!view) {
            stack.pop();
            stack.viewsStacked.pop(operation);
            return ;
        }
        if (!stack.viewsStacked.find(function(v) {
            return v === view;
        })) {
            console.error("View not found in stack: " + view);
            return ;
        }
        while (stack.viewsStacked[stack.viewsStacked.length - 1] !== view) {
            stack.pop();
            stack.viewsStacked.pop(operation);
        }
    }

    function get(view, behavior) : int {
        return stack.get(stack.get(view), behavior);
    }

    function clear() {
        stack.clear();
        stack.viewsStacked = [];
    }

    onViewFactoryChanged: {
        reload();
    }
    objectName: "applicationStackView"

    contentItem: T.StackView {
        id: stack

        property var viewsStacked: [viewFactory.mainView]

        function get(view) : int {
            return viewsStacked.find(function(v) {
                return v === view;
            });
        }

    }

}

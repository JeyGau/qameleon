import QtQuick 2.15

Item {
    id: factory

    required property int mainView

    function get(view) : Component {
        for (var i = 0; i < children.length; i++) {
            if (children[i].name === view)
                return children[i].component_;

        }
        return null;
    }

    component View: Item {
        required property int name
        default property Component component_
    }

}

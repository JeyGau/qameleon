import QtQuick 2.15

// TODO: move this API to C++

Item {
    id: root

    property int mainView: children[0].key

    function get(view) : Component {
        for (var i = 0; i < children.length; i++) {
            if (children[i].key === view)
                return children[i].component_;

        }
        return null;
    }

    component View: Item {
        required property int key
        property string name: ""
        default property Component component_
    }

}

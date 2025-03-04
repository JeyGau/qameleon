import QtQuick 2.15

Item {
    id: factory

    required property int mainView

    component View: Item {
        required property int name
        default property Component component_ 
    }

    function create(view) {
        for (var i = 0; i < children.length; i++) {
            if (children[i].name === view) {
                return children[i].component_.createObject(factory);
            }
        }
    }

}

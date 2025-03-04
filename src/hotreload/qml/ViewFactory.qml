import QtQuick 2.15

Item {
    id: factory

    required property int mainView

    component View: Item {
        required property int enum_
        required property Component component_ 
    }

    function create(view) {
        for (var i = 0; i < children.length; i++) {
            if (children[i].enum_ === view) {
                return children[i].component_.createObject(factory);
            }
        }
    }

}

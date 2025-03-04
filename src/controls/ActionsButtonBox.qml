import qameleon.controls.styles 1.0
import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Templates 2.15 as QQC2
import "private" as P

QQC2.Control {
    id: control

    enum Alignment {
        AlignLeft, // Aligns the content to the left
        AlignRight, // Aligns the content to the right
        AlignCenter, // Aligns the content to the center
        AlignJustify // Aligns the content to the left and right edges
    }

    enum Role {
        Primary, // Primary action button (see https://m2.material.io/design/color/the-color-system.html#color-theme-creation)
        Secondary // Secondary action button (see https://m2.material.io/design/color/the-color-system.html#color-theme-creation)
    }

    default property QQC2.ActionGroup actionGroup
    property int alignment: ActionsButtonBox.Alignment.AlignJustify
    property ActionsButtonBoxStyle style: ActionsButtonBoxStyle {}
    readonly property var actions: actionGroup.actions

    padding: 0
    spacing: 16

    background: P.Background {
        style: control.style.background
    }

    contentItem: Item {
        implicitHeight: buttonLayout.height

        RowLayout {
            id: buttonLayout

            spacing: control.spacing
            width: Math.min(implicitWidth, parent.width)

            anchors {
                verticalCenter: parent.verticalCenter
                left: control.alignment === ActionsButtonBox.Alignment.AlignLeft || control.alignment === ActionsButtonBox.Alignment.AlignJustify ? parent.left : undefined
                right: control.alignment === ActionsButtonBox.Alignment.AlignRight || control.alignment === ActionsButtonBox.Alignment.AlignJustify ? parent.right : undefined
                horizontalCenter: control.alignment === ActionsButtonBox.Alignment.AlignCenter ? parent.horizontalCenter : undefined
            }

            RowLayout {
                id: secondaryButtonsLayout

                spacing: control.spacing
                Layout.fillHeight: true
                Layout.preferredWidth: implicitWidth
                Layout.alignment: {
                    var alignment = Qt.AlignVCenter;
                    switch (control.alignment) {
                    case ActionsButtonBox.Alignment.AlignLeft:
                    case ActionsButtonBox.Alignment.AlignJustify:
                        alignment |= Qt.AlignLeft;
                        break;
                    case ActionsButtonBox.Alignment.AlignRight:
                        alignment |= Qt.AlignRight;
                        break;
                    case ActionsButtonBox.Alignment.AlignCenter:
                        alignment |= Qt.AlignHCenter;
                        break;
                    }
                }

                Repeater {
                    id: secondaryRepeater

                    model: {
                        var actions = [];
                        for (var i = 0; i < control.actions.length; i++) {
                            if (control.actions[i].role === ActionsButtonBox.Role.Secondary)
                                actions.push(control.actions[i]);

                        }
                        return actions;
                    }

                    delegate: Button {
                        required property int index

                        Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                        Layout.preferredWidth: control.style.preferredButtonWidth
                        visible: secondaryRepeater.model[index].visible
                        style: control.style.secondaryButtonStyle
                        text: secondaryRepeater.model[index].text
                        enabled: secondaryRepeater.model[index].enabled
                        onClicked: secondaryRepeater.model[index].triggered()
                    }

                }

            }

            RowLayout {
                id: primaryButtonsLayout

                spacing: control.spacing
                Layout.fillHeight: true
                Layout.preferredWidth: implicitWidth
                Layout.alignment: {
                    var alignment = Qt.AlignVCenter;
                    switch (control.alignment) {
                    case ActionsButtonBox.Alignment.AlignLeft:
                        alignment |= Qt.AlignLeft;
                        break;
                    case ActionsButtonBox.Alignment.AlignJustify:
                    case ActionsButtonBox.Alignment.AlignRight:
                        alignment |= Qt.AlignRight;
                        break;
                    case ActionsButtonBox.Alignment.AlignCenter:
                        alignment |= Qt.AlignHCenter;
                        break;
                    }
                }

                Repeater {
                    id: primaryRepeater

                    model: {
                        var actions = [];
                        for (var i = 0; i < control.actions.length; i++) {
                            if (control.actions[i].role === ActionsButtonBox.Role.Primary)
                                actions.push(control.actions[i]);

                        }
                        return actions;
                    }

                    delegate: Button {
                        required property int index

                        Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                        Layout.minimumWidth: implicitWidth
                        Layout.preferredWidth: control.style.preferredButtonWidth
                        visible: primaryRepeater.model[index].visible
                        style: control.style.primaryButtonStyle
                        text: primaryRepeater.model[index].text
                        enabled: primaryRepeater.model[index].enabled
                        onClicked: primaryRepeater.model[index].triggered()
                    }

                }

            }

        }

    }

}

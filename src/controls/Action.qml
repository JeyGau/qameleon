import QtQml 2.15
import QtQuick.Controls 2.15 as QQC2

QQC2.Action {
    required property int role // ActionsButtonBox.Role if used within an ActionsButtonBox
    property bool visible: true

    enabled: true
}

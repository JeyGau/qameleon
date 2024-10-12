pragma singleton

import QtQml 2.15
import QtQuick.Controls.Material 2.15

QtObject {
    property color primaryColor: Material.primary
    property color primaryVariantColor: Material.primaryVariant
    property color secondaryColor: Material.accent
    property color secondaryVariantColor: Material.accentVariant
    property color primaryTextColor: Material.onPrimary
    property color secondaryTextColor: Material.onSecondary
}
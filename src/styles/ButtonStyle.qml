import QtQml 2.15
import QtQuick.Controls 2.15
import "private" as P
import qameleon.theming 1.0

QtObject {
    property Button control
    property P.Background background: P.Background {color: ThemeManager.theme.primaryColor}
    property LabelStyle label: LabelStyle {}
}
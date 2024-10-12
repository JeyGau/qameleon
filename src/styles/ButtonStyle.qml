import QtQml 2.15
import QtQuick.Controls 2.15
import "private" as P

QtObject {
    property Button control
    property P.Background background: P.Background {}
    property LabelStyle label: LabelStyle {}
}
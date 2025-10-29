import QtQuick.Templates as T
import org.qameleon.controls.styles
import "private" as P

T.Page {
    id: control

    property PageStyle style: PageStyle {}

    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding + implicitHeaderHeight + implicitFooterHeight)
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding, implicitHeaderWidth, implicitFooterWidth)

    background: P.Background {
        style: control.style.background
    }
}

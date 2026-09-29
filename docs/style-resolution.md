# Style resolution

Qameleon styles must support live changes without replacing control instances.
The style resolution order is:

1. A value assigned directly to the control's style object.
2. The nearest inherited attached style value on the control or an ancestor.
3. The corresponding value from `ThemeManager.theme`.
4. The library fallback.

Theme values are reactive. Reassigning `ThemeManager.theme`, or changing a
property on the active theme, updates controls whose values have not been
overridden locally.

Elevation is owned and rendered by the background's `dropShadow` style. The
active theme supplies `dropShadow.elevation`; that value controls whether the
shadow is enabled and derives its default blur radius and vertical offset.
Direct `dropShadow` assignments can override the elevation or any derived
property independently. The renderer uses transparent borders and caching.

The initial theme-backed properties are `borderRadius` and `elevation`:

```qml
AbstractTheme {
    borderRadius: 8
    elevation: 4
}
```

A direct style assignment remains local:

```qml
Qameleon.Button {
    style.background.radius: 2
    style.background.dropShadow.elevation: 0
}
```

## Planned attached API

Custom style modules will expose an attached property provider so values can be
inherited through the visual tree, following the Qt Quick Controls style APIs:

```qml
ApplicationWindow {
    MyStyle.elevation: 8
    MyStyle.radius: 12

    Qameleon.Button {
        text: "Inherited"
    }

    Qameleon.Button {
        MyStyle.elevation: 2
        text: "Local subtree override"
    }
}
```

This API requires a C++ attached-property type for each generated/custom style
module. Attached values must distinguish an unset value from an explicit zero,
inherit from the nearest ancestor, emit change notifications, and fall back to
the active theme. The Qt 5.15 and Qt 6.8 implementations must expose the same
QML contract.
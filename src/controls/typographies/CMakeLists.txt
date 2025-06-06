qt_add_qml_module(qameleon_controls_typographies
        OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/controls/typographies
        URI "org.qameleon.controls.typographies"
        VERSION 1.0
        QML_FILES
                Body1.qml
                Body2.qml
                Caption.qml
                Headline1.qml
                Headline2.qml
                Headline3.qml
                Headline4.qml
                Headline5.qml
                Headline6.qml
                Overline.qml
                Subtitle1.qml
                Subtitle2.qml
)

add_subdirectory(scales)

# Install the QML module files manually (Qt 6.2.4 compatible)
install(DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/controls/typographies/
    DESTINATION qml/org/qameleon/controls/typographies
    FILES_MATCHING 
    PATTERN "*"
)
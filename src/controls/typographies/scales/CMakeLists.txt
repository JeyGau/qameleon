qt_add_qml_module(qameleon_controls_typographies_scales
        URI "org.qameleon.controls.typographies.scales"
        OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/controls/typographies/scales
        VERSION 1.0
        QML_FILES
                Body1.qml
                Body2.qml
                Caption.qml
                H1.qml
                H2.qml
                H3.qml
                H4.qml
                H5.qml
                H6.qml
                Overline.qml
                Subtitle1.qml
                Subtitle2.qml
        
)

# Install the QML module files manually (Qt 6.2.4 compatible)
install(DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/controls/typographies/scales/
    DESTINATION qml/org/qameleon/controls/typographies/scales
    FILES_MATCHING 
    PATTERN "*"
)
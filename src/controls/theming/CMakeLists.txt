set_source_files_properties(ThemeManager.qml PROPERTIES
    QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(qameleon_controls_theming
        URI "org.qameleon.controls.theming"
        VERSION 1.0
        OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/controls/theming
        QML_FILES
                AbstractTheme.qml
                ThemeManager.qml        
)

# Install the QML module files manually (Qt 6.2.4 compatible)
install(DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/controls/theming/
    DESTINATION qml/org/qameleon/controls/theming
    FILES_MATCHING 
    PATTERN "*"
)

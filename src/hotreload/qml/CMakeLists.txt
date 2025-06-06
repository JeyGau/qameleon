qt_add_qml_module(qameleon_hotreload_qml
        URI "org.qameleon.hotreload"
        VERSION 1.0
        OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/hotreload
        QML_FILES
                ApplicationStackView.qml
                ApplicationWindow.qml
                ViewFactory.qml
        
)

# Install the QML module files manually (Qt 6.2.4 compatible)
install(DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/hotreload/
    DESTINATION qml/org/qameleon/hotreload
    FILES_MATCHING 
    PATTERN "*"
)

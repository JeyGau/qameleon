# Install the QML module
install(DIRECTORY ./
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/controls)
install(DIRECTORY ./styles/
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/controls/styles)
install(DIRECTORY ./theming/
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/controls/theming)
install(DIRECTORY ./typographies/
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/controls/typographies)
install(DIRECTORY ./typographies/scales/
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/controls/typographies/scales)
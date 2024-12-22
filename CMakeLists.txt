cmake_minimum_required(VERSION 3.16)
project(qameleon)

# Install the QML module
install(DIRECTORY src/controls/
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/controls)
install(DIRECTORY src/controls/styles/
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/controls/styles)
install(DIRECTORY src/controls/theming/
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/controls/theming)
install(DIRECTORY src/controls/typographies/
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/controls/typographies)
install(DIRECTORY src/controls/typographies/scales/
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/controls/typographies/scales)
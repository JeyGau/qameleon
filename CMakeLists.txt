cmake_minimum_required(VERSION 3.16)
project(qameleon)

# Install the QML module
install(DIRECTORY src/controls/
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/controls)
install(DIRECTORY src/styles/
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/styles)
        install(DIRECTORY src/theming/
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/theming)

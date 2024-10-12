cmake_minimum_required(VERSION 3.14)

project(QameleonTest VERSION 0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find the required Qt5 packages
find_package(Qt5 REQUIRED COMPONENTS Quick QuickControls2)

# Add the QML resources to the executable
add_executable(QameleonTest main.cpp qml.qrc)

# Link to Qt's Quick and Controls libraries
target_link_libraries(QameleonTest
    PRIVATE Qt5::Quick Qt5::QuickControls2
)

# Add the QML import path to find the qameleon module
set(QML_IMPORT_PATH "${CMAKE_INSTALL_PREFIX}/lib/qt/qml")


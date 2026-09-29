cmake_minimum_required(VERSION 3.21)

project(qameleon VERSION 1.0.0 LANGUAGES CXX)

include(CTest)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(QT_QML_GENERATE_QMLLS_INI ON)

# Find Qt6 components
find_package(Qt6 REQUIRED COMPONENTS Core Quick Qml QuickControls2)

# Enable automatic MOC, UIC, and RCC processing (Qt 6.2.4 compatible)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(QT_QML_GENERATE_QMLLS_INI ON)

# Define available components
set(QAMELEON_COMPONENTS controls hotreload)

# Add subdirectories for each component
add_subdirectory(src/controls)
add_subdirectory(src/hotreload)

if(BUILD_TESTING)
    find_package(Python3 REQUIRED COMPONENTS Interpreter)
    get_target_property(QT_QMAKE_EXECUTABLE Qt6::qmake IMPORTED_LOCATION)
    get_filename_component(QT_BINARY_DIRECTORY "${QT_QMAKE_EXECUTABLE}" DIRECTORY)
    find_program(QAMELEON_QMLTESTRUNNER_EXECUTABLE
        NAMES qmltestrunner
        HINTS "${QT_BINARY_DIRECTORY}"
        NO_DEFAULT_PATH
        NO_CACHE
        REQUIRED
    )

    add_test(
        NAME qameleon_controls_manifest
        COMMAND
            ${Python3_EXECUTABLE}
            ${CMAKE_CURRENT_SOURCE_DIR}/tools/validate_controls_manifest.py
            ${CMAKE_CURRENT_SOURCE_DIR}/spec/controls.json
            ${CMAKE_CURRENT_SOURCE_DIR}/src/controls
    )

    add_test(
        NAME qameleon_style_context
        COMMAND
            ${QAMELEON_QMLTESTRUNNER_EXECUTABLE}
            -input ${CMAKE_CURRENT_SOURCE_DIR}/tests/qml/tst_style_context.qml
            -import ${CMAKE_BINARY_DIR}/qml
    )

    add_test(
        NAME qameleon_abstract_button
        COMMAND
            ${QAMELEON_QMLTESTRUNNER_EXECUTABLE}
            -input ${CMAKE_CURRENT_SOURCE_DIR}/tests/qml/tst_abstract_button.qml
            -import ${CMAKE_BINARY_DIR}/qml
    )

    add_test(
        NAME qameleon_round_button
        COMMAND
            ${QAMELEON_QMLTESTRUNNER_EXECUTABLE}
            -input ${CMAKE_CURRENT_SOURCE_DIR}/tests/qml/tst_round_button.qml
            -import ${CMAKE_BINARY_DIR}/qml
    )

    add_test(
        NAME qameleon_tool_button
        COMMAND
            ${QAMELEON_QMLTESTRUNNER_EXECUTABLE}
            -input ${CMAKE_CURRENT_SOURCE_DIR}/tests/qml/tst_tool_button.qml
            -import ${CMAKE_BINARY_DIR}/qml
    )

    add_test(
        NAME qameleon_runtime_theme
        COMMAND
            ${QAMELEON_QMLTESTRUNNER_EXECUTABLE}
            -input ${CMAKE_CURRENT_SOURCE_DIR}/tests/qml/tst_runtime_theme.qml
            -import ${CMAKE_BINARY_DIR}/qml
    )

    set_tests_properties(qameleon_style_context qameleon_abstract_button qameleon_round_button qameleon_tool_button qameleon_runtime_theme PROPERTIES
        ENVIRONMENT "QT_QPA_PLATFORM=offscreen"
    )
endif()

# Install CMake config files for find_package() support
include(CMakePackageConfigHelpers)

# Create the main config file
configure_package_config_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake/qameleonConfig.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/qameleonConfig.cmake"
    INSTALL_DESTINATION lib/cmake/qameleon
)

# Create version file
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/qameleonConfigVersion.cmake"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)

# Export targets for each component
install(EXPORT qameleonTargets
    FILE qameleonTargets.cmake
    NAMESPACE qameleon::
    DESTINATION lib/cmake/qameleon
)

# Install config files
install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/qameleonConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/qameleonConfigVersion.cmake"
    DESTINATION lib/cmake/qameleon
)
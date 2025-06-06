cmake_minimum_required(VERSION 3.21)

project(qameleon VERSION 1.0.0 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find Qt6 components
find_package(Qt6 REQUIRED COMPONENTS Core Quick Qml)

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
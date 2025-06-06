list(APPEND CONTROLS_MODULE_QML_PRIVATE_FILES private/Background.qml)
list(APPEND CONTROLS_MODULE_QML_FILES Action.qml ActionsButtonBox.qml ApplicationWindow.qml Button.qml Control.qml Label.qml Page.qml ${CONTROLS_MODULE_QML_PRIVATE_FILES})

set_source_files_properties(${CONTROLS_MODULE_QML_PRIVATE_FILES} PROPERTIES
    QT_QML_INTERNAL_TYPE  TRUE
)

# Create the QML module
qt_add_qml_module(qameleon_controls
    URI "org.qameleon.controls"
    VERSION 1.0
    QML_FILES
        ${CONTROLS_MODULE_QML_FILES}
    OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/controls
)

add_subdirectory(styles)
add_subdirectory(typographies)
add_subdirectory(theming)

# Create an alias target for the component
add_library(qameleon::controls ALIAS qameleon_controls)
        
# Set target properties
set_target_properties(qameleon_controls PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/controls
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/controls
    EXPORT_NAME controls
)

# Link Qt libraries
target_link_libraries(qameleon_controls PUBLIC
    Qt6::Core
    Qt6::Quick
    Qt6::Qml
)


# Install the QML module files manually (Qt 6.2.4 compatible)
install(DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/controls/
    DESTINATION qml/org/qameleon/controls
    FILES_MATCHING 
    PATTERN "*"
)

# Add to the export set
install(TARGETS qameleon_controls
    EXPORT qameleonTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)
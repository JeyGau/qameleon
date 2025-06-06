list(APPEND STYLES_MODULE_QML_PRIVATE_FILES private/Background.qml private/Border.qml private/Padding.qml)
list(APPEND STYLES_MODULE_QML_FILES ActionsButtonBoxStyle.qml ButtonStyle.qml ControlStyle.qml LabelStyle.qml PageStyle.qml Typography.qml ${STYLES_MODULE_QML_PRIVATE_FILES})

set_source_files_properties(${STYLES_MODULE_QML_PRIVATE_FILES} PROPERTIES
    QT_QML_INTERNAL_TYPE  TRUE
)

qt_add_qml_module(qameleon_controls_styles
        URI "org.qameleon.controls.styles"
        VERSION 1.0
        OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/controls/styles
        QML_FILES
                ${STYLES_MODULE_QML_FILES}
)

install(DIRECTORY ${CMAKE_BINARY_DIR}/qml/org/qameleon/controls/styles/
    DESTINATION qml/org/qameleon/controls/styles
    FILES_MATCHING PATTERN "*"
)
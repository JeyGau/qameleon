set(SOURCES
    hot_reloader.cpp
    qml_files_watcher.cpp
)

set(HEADERS
    hot_reloader.hpp
    qml_files_watcher.hpp
)
add_subdirectory(qml)

# Find the required Qt6 packages
find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2 Qml Gui)

# Add the library
add_library(qameleon_hotreload ${SOURCES} ${HEADERS})
add_library(qameleon::hotreload ALIAS qameleon_hotreload)

set_target_properties(qameleon_hotreload PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    EXPORT_NAME hotreload
)

# Link to Qt's Quick and Controls libraries
target_link_libraries(qameleon_hotreload
    PRIVATE Qt6::Quick Qt6::QuickControls2 Qt6::Qml
)

# Install the header files
install(FILES ${HEADERS} DESTINATION include/qameleon)
install(TARGETS qameleon_hotreload 
    EXPORT qameleonTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)
# Add the source files
set(SOURCES
    hot_reloader.cpp
    qml_files_watcher.cpp
)

# Add the header files
set(HEADERS
    hot_reloader.hpp
    qml_files_watcher.hpp
)

# Find the required Qt5 packages
find_package(Qt5 REQUIRED COMPONENTS Quick QuickControls2 Qml Gui)
# Add the library
add_library(qameleon_hot_reload ${SOURCES} ${HEADERS})

# Link to Qt's Quick and Controls libraries
target_link_libraries(qameleon_hot_reload
    PRIVATE Qt5::Quick Qt5::QuickControls2 Qt5::Qml
)

# Install the library
install(TARGETS qameleon_hot_reload
        LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/hotreload
        ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/hotreload
        )

# Install the header files
install(FILES ${HEADERS} DESTINATION include/qameleon)

# Install the QML module
install(DIRECTORY qml/ DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt/qml/qameleon/hotreload)
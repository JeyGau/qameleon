#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "qameleon::controls" for configuration ""
set_property(TARGET qameleon::controls APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(qameleon::controls PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libqameleon_controls.so"
  IMPORTED_SONAME_NOCONFIG "libqameleon_controls.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS qameleon::controls )
list(APPEND _IMPORT_CHECK_FILES_FOR_qameleon::controls "${_IMPORT_PREFIX}/lib/libqameleon_controls.so" )

# Import target "qameleon::hotreload" for configuration ""
set_property(TARGET qameleon::hotreload APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(qameleon::hotreload PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libqameleon_hotreload.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS qameleon::hotreload )
list(APPEND _IMPORT_CHECK_FILES_FOR_qameleon::hotreload "${_IMPORT_PREFIX}/lib/libqameleon_hotreload.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was qameleonConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

include(CMakeFindDependencyMacro)

# Find required Qt6 components
find_dependency(Qt6 REQUIRED COMPONENTS Core Quick Qml)

# List of available components
set(qameleon_COMPONENTS controls hotreload)

# Check if components were requested
if(qameleon_FIND_COMPONENTS)
    foreach(component ${qameleon_FIND_COMPONENTS})
        if(NOT component IN_LIST qameleon_COMPONENTS)
            set(qameleon_FOUND FALSE)
            set(qameleon_NOT_FOUND_MESSAGE "Requested component '${component}' not found. Available components: ${qameleon_COMPONENTS}")
            return()
        endif()
    endforeach()
    set(qameleon_FIND_COMPONENTS_LIST ${qameleon_FIND_COMPONENTS})
else()
    # If no components specified, include all
    set(qameleon_FIND_COMPONENTS_LIST ${qameleon_COMPONENTS})
endif()

# Include the targets file
include("${CMAKE_CURRENT_LIST_DIR}/qameleonTargets.cmake")

# Set component-specific found variables
foreach(component ${qameleon_FIND_COMPONENTS_LIST})
    if(TARGET qameleon::${component})
        set(qameleon_${component}_FOUND TRUE)
    else()
        set(qameleon_${component}_FOUND FALSE)
        if(qameleon_FIND_REQUIRED_${component})
            set(qameleon_FOUND FALSE)
            set(qameleon_NOT_FOUND_MESSAGE "Required component '${component}' not found")
            return()
        endif()
    endif()
endforeach()

check_required_components(qameleon)

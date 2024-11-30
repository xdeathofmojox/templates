cmake_minimum_required(VERSION 3.13.0)

#########################################
# setup project
#########################################
set(PROJECT_NAME "DefaultProjectName" CACHE STRING "Project Name")
set(PROJECT_VERSION "0.0.0" CACHE STRING "Project Version")
# TODO: Rename lib-name
set(LIBRARY_NAME "lib-name" CACHE STRING "Library Name")
set(LIB_TYPE "SHARED")
if(BUILD_STATIC)
    set(LIB_TYPE "STATIC")
endif()

project(${PROJECT_NAME} 
    VERSION ${PROJECT_VERSION} 
    LANGUAGES CXX)

#########################################
# create library
#########################################
list(APPEND SRC_LIST
    # TODO: Replace sample code
    sample
)

list(TRANSFORM SRC_LIST
    PREPEND ${CMAKE_CURRENT_LIST_DIR}/src/)
list(TRANSFORM SRC_LIST
    APPEND .cc)

add_library(${LIBRARY_NAME} ${LIB_TYPE} ${SRC_LIST})

#########################################
# target includes
#########################################
target_include_directories(${LIBRARY_NAME} PUBLIC 
    $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
    $<INSTALL_INTERFACE:include>)

#########################################
# target link libraries
#########################################
# target_link_libraries(${LIBRARY_NAME} PRIVATE other-lib::other-lib)

#########################################
# set position independent code
#########################################
if(LIB_TYPE STREQUAL "SHARED")
    set_target_properties(${LIBRARY_NAME} 
        PROPERTIES POSITION_INDEPENDENT_CODE ON 
        SOVERSION ${PROJECT_VERSION})
endif()

#########################################
# compiler optimization
#########################################
target_compile_options(${LIBRARY_NAME} PRIVATE -O1)

#########################################
# export compile commands
#########################################
set_target_properties(${LIBRARY_NAME} 
    PROPERTIES EXPORT_COMPILE_COMMANDS ON)

#########################################
# target c++ 20
#########################################
target_compile_features(${LIBRARY_NAME} PRIVATE cxx_std_20)

#########################################
# install headers
#########################################
install(DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/include/"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    FILES_MATCHING
        PATTERN "*.h"
        PATTERN "*.tpp")

#########################################
# install library
#########################################
install(TARGETS ${LIBRARY_NAME}
    EXPORT ${LIBRARY_NAME}Targets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)

#########################################
# install cmake configs
#########################################
install(EXPORT ${LIBRARY_NAME}Targets
    FILE ${LIBRARY_NAME}Targets.cmake
    NAMESPACE ${LIBRARY_NAME}::
    DESTINATION lib/cmake/${LIBRARY_NAME})

include(CMakePackageConfigHelpers)
write_basic_package_version_file("${CMAKE_BINARY_DIR}/${LIBRARY_NAME}ConfigVersion.cmake"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion)

install(FILES "${LIBRARY_NAME}Config.cmake" "${CMAKE_BINARY_DIR}/${LIBRARY_NAME}ConfigVersion.cmake" "${CMAKE_BINARY_DIR}/compile_commands.json"
    DESTINATION lib/cmake/${LIBRARY_NAME})
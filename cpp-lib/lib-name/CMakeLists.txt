cmake_minimum_required(VERSION 3.13.0)

#########################################
# setup project
#########################################
set(PROJECT_NAME "DefaultProjectName" CACHE STRING "Project Name")
set(PROJECT_VERSION "0.0.0" CACHE STRING "Project Version")
# TODO: Rename lib-name
set(TARGET_NAME "lib-name" CACHE STRING "Library Name")
set(LIB_TYPE "SHARED")
if(BUILD_STATIC)
    set(LIB_TYPE "STATIC")
endif()

# Default to Debug build if not specified
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type" FORCE)
endif()

project(${PROJECT_NAME} 
    VERSION ${PROJECT_VERSION} 
    LANGUAGES CXX)

#########################################
# Sanitizer Options
#########################################
# Allow specifying sanitizers
option(ENABLE_ASAN "Enable AddressSanitizer" OFF)
option(ENABLE_MSAN "Enable MemorySanitizer" OFF)
option(ENABLE_TSAN "Enable ThreadSanitizer" OFF)
option(ENABLE_UBSAN "Enable UndefinedBehaviorSanitizer" OFF)

message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")
message(STATUS "ASAN: ${ENABLE_ASAN}, MSAN: ${ENABLE_MSAN}, TSAN: ${ENABLE_TSAN}, UBSAN: ${ENABLE_UBSAN}")
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "Sanitizers will be applied")
else()
    message(STATUS "Sanitizers will not be applied in non-debug build type")
endif()

# Setup compile flags for sanitizers
set(SANITIZER_FLAGS "")
if(ENABLE_ASAN)
    list(APPEND SANITIZER_FLAGS "-fsanitize=address")
endif()
if(ENABLE_MSAN)
    list(APPEND SANITIZER_FLAGS "-fsanitize=memory")
endif()
if(ENABLE_TSAN)
    list(APPEND SANITIZER_FLAGS "-fsanitize=thread")
endif()
if(ENABLE_UBSAN)
    list(APPEND SANITIZER_FLAGS "-fsanitize=undefined")
endif()

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

add_library(${TARGET_NAME} ${LIB_TYPE} ${SRC_LIST})

#########################################
# target includes
#########################################
target_include_directories(${TARGET_NAME} PUBLIC 
    $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)


#########################################
# target link libraries
#########################################
# target_link_libraries(${TARGET_NAME} PRIVATE other-lib::other-lib)

#########################################
# set position independent code
#########################################
if(LIB_TYPE STREQUAL "SHARED")
    set_target_properties(${TARGET_NAME} 
        PROPERTIES POSITION_INDEPENDENT_CODE ON 
        SOVERSION ${PROJECT_VERSION})
endif()

#########################################
# compiler optimization
#########################################
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_options(${TARGET_NAME} PRIVATE -Og)
else()
    target_compile_options(${TARGET_NAME} PRIVATE -O3)
endif()

#########################################
# debug symbols
#########################################
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_options(${TARGET_NAME} PRIVATE -g)
endif()

#########################################
# warnings
#########################################
target_compile_options(${TARGET_NAME} PRIVATE -Wall -Wextra -Wpedantic)
target_compile_options(${TARGET_NAME} PRIVATE -Werror)

#########################################
# sanitizers
#########################################
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_options(${TARGET_NAME} PRIVATE ${SANITIZER_FLAGS})
    target_link_options(${TARGET_NAME} PRIVATE ${SANITIZER_FLAGS})
endif()

#########################################
# export compile commands
#########################################
set_target_properties(${TARGET_NAME} 
    PROPERTIES EXPORT_COMPILE_COMMANDS ON)

#########################################
# target c++ 20
#########################################
target_compile_features(${TARGET_NAME} PRIVATE cxx_std_20)

#########################################
# install headers
#########################################
install(DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/include/"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    FILES_MATCHING
        PATTERN "*.h"
        PATTERN "*.tpp")

#########################################
# install library + export targets
#########################################
install(TARGETS ${TARGET_NAME}
    EXPORT ${TARGET_NAME}Targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

install(EXPORT ${TARGET_NAME}Targets
    FILE ${TARGET_NAME}Targets.cmake
    NAMESPACE ${TARGET_NAME}::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${TARGET_NAME})

#########################################
# install package config files
#########################################
include(CMakePackageConfigHelpers)

write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}ConfigVersion.cmake"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion)

configure_package_config_file(
    "${CMAKE_CURRENT_LIST_DIR}/cmake/${TARGET_NAME}Config.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}Config.cmake"
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${TARGET_NAME})

install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}Config.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}ConfigVersion.cmake"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${TARGET_NAME})
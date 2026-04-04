cmake_minimum_required(VERSION 3.13.0)

#########################################
# setup project
#########################################
set(PROJECT_NAME "DefaultTestProjectName" CACHE STRING "Project Name")
set(PROJECT_VERSION "0.0.0" CACHE STRING "Project Version")
set(TARGET_NAME "default_test" CACHE STRING "Test Name")

# Default to Debug build if not specified
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type" FORCE)
endif()

project(${PROJECT_NAME}
    VERSION ${PROJECT_VERSION}
    LANGUAGES C)

include(GNUInstallDirs)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

#########################################
# Sanitizer Options
#########################################
option(ENABLE_ASAN "Enable AddressSanitizer" OFF)
option(ENABLE_MSAN "Enable MemorySanitizer" OFF)
option(ENABLE_TSAN "Enable ThreadSanitizer" OFF)
option(ENABLE_UBSAN "Enable UndefinedBehaviorSanitizer" OFF)

message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")
message(STATUS "ASAN: ${ENABLE_ASAN}, MSAN: ${ENABLE_MSAN}, TSAN: ${ENABLE_TSAN}, UBSAN: ${ENABLE_UBSAN}")
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

if(SANITIZER_FLAGS)
    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
        message(STATUS "Sanitizers will be applied: ${SANITIZER_FLAGS}")
    else()
        message(WARNING "Sanitizers requested but will not be applied in non-Debug build type")
    endif()
endif()

#########################################
# create test executable
#########################################
list(APPEND SRC_LIST
    # TODO: Replace sample code
    sample_test
)

list(TRANSFORM SRC_LIST PREPEND ${CMAKE_CURRENT_LIST_DIR}/src/)
list(TRANSFORM SRC_LIST APPEND .c)

add_executable(${TARGET_NAME} ${SRC_LIST})

#########################################
# target link libraries
#########################################
find_package(cmocka REQUIRED)
# TODO: Rename lib-name
find_package(lib-name REQUIRED)

target_link_libraries(${TARGET_NAME} PRIVATE
    # TODO: Rename lib-name
    lib-name::lib-name
    cmocka::cmocka)

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
# target C11
#########################################
target_compile_features(${TARGET_NAME} PRIVATE c_std_23)

#########################################
# install test
#########################################
install(TARGETS ${TARGET_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

#########################################
# install cmake configs
#########################################
install(FILES "${CMAKE_BINARY_DIR}/compile_commands.json"
    DESTINATION lib/cmake/${TARGET_NAME})

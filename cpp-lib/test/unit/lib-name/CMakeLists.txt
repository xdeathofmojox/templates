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
# create test executable
#########################################
list(APPEND SRC_LIST
    # TODO: Replace sample code
    sample_test
)

list(TRANSFORM SRC_LIST PREPEND ${CMAKE_CURRENT_LIST_DIR}/src/)
list(TRANSFORM SRC_LIST APPEND .cc)

add_executable(${TARGET_NAME} ${SRC_LIST})

#########################################
# target includes
#########################################
# target_include_directories(${LIBRARY_NAME} PUBLIC 
#     $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>)

#########################################
# target link libraries
#########################################
find_package(GTest REQUIRED)
# TODO: Rename lib-name
find_package(lib-name REQUIRED)

target_link_libraries(${TARGET_NAME} PRIVATE 
    # TODO: Rename lib-name
    lib-name::lib-name
    GTest::gmock
    GTest::gtest_main)

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
# install test
#########################################
install(TARGETS ${TARGET_NAME} DESTINATION "${CMAKE_INSTALL_PREFIX}/bin")

#########################################
# install cmake configs
#########################################
install(FILES "${CMAKE_BINARY_DIR}/compile_commands.json"
    DESTINATION lib/cmake/${TARGET_NAME})
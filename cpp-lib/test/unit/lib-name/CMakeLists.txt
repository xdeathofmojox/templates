cmake_minimum_required(VERSION 3.13.0)

#########################################
# setup project
#########################################
set(PROJECT_NAME "DefaultTestProjectName" CACHE STRING "Project Name")
set(PROJECT_VERSION "0.0.0" CACHE STRING "Project Version")
set(TARGET_NAME "default_test" CACHE STRING "Test Name")

project(${PROJECT_NAME} 
    VERSION ${PROJECT_VERSION}
    LANGUAGES CXX)

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
target_compile_options(${TARGET_NAME} PRIVATE -O1)

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
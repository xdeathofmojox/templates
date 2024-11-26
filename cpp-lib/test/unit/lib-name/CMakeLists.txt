cmake_minimum_required(VERSION 3.13.0)

# setup
set(PROJECT_NAME "DefaultTestProjectName" CACHE STRING "Project Name")
set(PROJECT_VERSION "0.0.0" CACHE STRING "Project Version")
set(TEST_NAME "default_test" CACHE STRING "Test Name")

project(${PROJECT_NAME} VERSION ${PROJECT_VERSION} LANGUAGES CXX)

# create library
list(APPEND TEST_SRCS
    # TODO: Replace sample code
    sample_test
)

list(TRANSFORM TEST_SRCS PREPEND ${CMAKE_CURRENT_LIST_DIR}/src/)
list(TRANSFORM SRC_LIST APPEND .cc)

add_executable(${TEST_NAME} ${TEST_SRCS})

# target includes
# target_include_directories(${LIBRARY_NAME} PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>)

# target link libraries
find_package(GTest REQUIRED)
# TODO: Rename lib_name
find_package(lib-name REQUIRED)
target_link_libraries(${TEST_NAME} PRIVATE lib-name::lib-name GTest::gmock GTest::gtest_main)

# compiler optimization
target_compile_options(${TEST_NAME} PRIVATE -O1)

# target c++ 20
target_compile_features(${TEST_NAME} PRIVATE cxx_std_20)

# install test
install(TARGETS ${TEST_NAME} DESTINATION "${CMAKE_INSTALL_PREFIX}/bin")
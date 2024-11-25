cmake_minimum_required(VERSION 3.13.0)

# setup
set(PROJECT_NAME "DefaultProjectName" CACHE STRING "Project Name")
set(PROJECT_VERSION "0.0.0" CACHE STRING "Project Version")
set(LIBRARY_NAME "lib_name" CACHE STRING "Library Name")
set(LIB_TYPE "SHARED")
if(BUILD_STATIC)
    set(LIB_TYPE "STATIC")
endif()

project(${PROJECT_NAME} VERSION ${PROJECT_VERSION} LANGUAGES CXX)

# create library
list(APPEND SRC_LIST
    # TODO: Replace sample code
    sample
)

list(TRANSFORM SRC_LIST PREPEND ${CMAKE_CURRENT_LIST_DIR}/src/)
list(TRANSFORM SRC_LIST APPEND .cc)

add_library(${LIBRARY_NAME} ${LIB_TYPE} ${SRC_LIST})

# target includes
target_include_directories(${LIBRARY_NAME} PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>)

# set position independent code
if(LIB_TYPE STREQUAL "SHARED")
    set_target_properties(${LIBRARY_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON SOVERSION ${PROJECT_VERSION})
endif()

# compiler optimization
target_compile_options(${LIBRARY_NAME} PRIVATE -O1)

# target c++ 20
target_compile_features(${LIBRARY_NAME} PRIVATE cxx_std_20)

# install headers
install(DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/include/" DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}" FILES_MATCHING PATTERN "*.h" PATTERN "*.tpp")

install(TARGETS ${LIBRARY_NAME} EXPORT ${LIBRARY_NAME}Config ARCHIVE)
export(TARGETS ${LIBRARY_NAME} NAMESPACE ${LIBRARY_NAME}:: FILE "${CMAKE_CURRENT_BINARY_DIR}/${LIBRARY_NAME}Config.cmake")
install(EXPORT ${LIBRARY_NAME}Config DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${LIBRARY_NAME}" NAMESPACE ${LIBRARY_NAME}::)
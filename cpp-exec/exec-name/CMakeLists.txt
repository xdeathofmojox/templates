cmake_minimum_required(VERSION 3.13.0)

#########################################
# setup project
#########################################
set(PROJECT_NAME "DefaultProjectName" CACHE STRING "Project Name")
set(PROJECT_VERSION "0.0.0" CACHE STRING "Project Version")
# TODO: Rename exec-name
set(TARGET_NAME "exec-name" CACHE STRING "Executable Name")

project(${PROJECT_NAME} 
    VERSION ${PROJECT_VERSION} 
    LANGUAGES CXX)

#########################################
# create executable
#########################################
list(APPEND SRC_LIST
    # TODO: Replace sample code
    main
)

list(TRANSFORM SRC_LIST
    PREPEND ${CMAKE_CURRENT_LIST_DIR}/src/)
list(TRANSFORM SRC_LIST
    APPEND .cc)

add_executable(${TARGET_NAME} ${SRC_LIST})

#########################################
# target includes
#########################################
target_include_directories(${TARGET_NAME} PUBLIC 
    $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
    $<INSTALL_INTERFACE:include>)

#########################################
# target link libraries
#########################################
# target_link_libraries(${TARGET_NAME} PRIVATE other-lib::other-lib)

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
install(TARGETS ${TARGET_NAME}
    EXPORT ${TARGET_NAME}Targets
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)

#########################################
# install cmake configs
#########################################
install(FILES "${CMAKE_BINARY_DIR}/compile_commands.json"
    DESTINATION lib/cmake/${TARGET_NAME})
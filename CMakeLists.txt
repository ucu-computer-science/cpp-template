cmake_minimum_required(VERSION 3.15)
project(adder CXX)

set(CMAKE_CXX_STANDARD 20)

find_package(Boost 1.65 COMPONENTS program_options REQUIRED)

include_directories(inc ${Boost_INCLUDE_DIR})

add_library(operations SHARED src/operations.cpp inc/operations/operations.hpp)

add_executable(add src/main.cpp)
target_link_libraries(add operations ${Boost_LIBRARIES})

if (PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
    message(FATAL_ERROR "In-source builds not allowed. Make a build directory and run CMake from there.\n")
endif ()

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

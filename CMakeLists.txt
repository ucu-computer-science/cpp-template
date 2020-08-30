cmake_minimum_required(VERSION 3.15)
project(adder CXX)

set(CMAKE_CXX_STANDARD 17)

include_directories(inc)
add_library(operations SHARED src/operations.cpp inc/operations/operations.hpp)
add_executable(add src/main.cpp)
target_link_libraries(add operations)

find_package(Boost 1.71 COMPONENTS program_options REQUIRED)
include_directories(${Boost_INCLUDE_DIR})
target_link_libraries(add ${Boost_LIBRARIES})

option(WARNINGS_AS_ERRORS "Treat compiler warnings as errors." OFF)
if (WARNINGS_AS_ERRORS)
    add_compile_options($<$<CXX_COMPILER_ID:MSVC>:/W4 /WX>
                        $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Wall -Wextra -Wpedantic -Werror>)
else ()
    add_compile_options($<$<CXX_COMPILER_ID:MSVC>:/Wall>
                        $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Wall -Wextra -Wpedantic>)
endif ()

option(SANITIZERS "Use sanitizers to detect errors." OFF)
if (SANITIZERS)
    set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/sanitizers" ${CMAKE_MODULE_PATH})
    set(SANITIZE_MEMORY ON) # incompatible with SANITIZE_ADDRESS: set(SANITIZE_ADDRESS ON)
    set(SANITIZE_UNDEFINED ON)
    find_package(Sanitizers)

    add_sanitizers(add)
endif ()

if (PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
    message(FATAL_ERROR "In-source builds not allowed. Make a build directory and run CMake from there.\n")
endif ()

if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif ()

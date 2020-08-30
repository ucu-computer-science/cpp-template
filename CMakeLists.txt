cmake_minimum_required(VERSION 3.15)
project(adder CXX)

set(CMAKE_CXX_STANDARD 17)

# Options
option(ENABLE_CONAN "Use Conan as a package manager." ON)
option(WARNINGS_AS_ERRORS "Treat compiler warnings as errors." OFF)
option(ENABLE_SANITIZERS "Use sanitizers to detect errors." OFF)

# Build release version by default
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif ()

# Project source compilation
include_directories(inc)
add_library(operations SHARED src/operations.cpp inc/operations/operations.hpp)
add_executable(add src/main.cpp)
target_link_libraries(add operations)

# Add external packages
find_package(Boost 1.71 COMPONENTS program_options REQUIRED)
target_link_libraries(add Boost::program_options)

# Sanitizers
if (ENABLE_SANITIZERS)
    set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/sanitizers" ${CMAKE_MODULE_PATH})
    set(SANITIZE_MEMORY ON)
#    set(SANITIZE_ADDRESS ON)
#    set(SANITIZE_THREAD ON)
    set(SANITIZE_UNDEFINED ON)
    find_package(Sanitizers)

    add_sanitizers(operations add)
endif ()

# Compiler warnings
if (WARNINGS_AS_ERRORS)
    add_compile_options($<$<CXX_COMPILER_ID:MSVC>:/W4 /WX>
                        $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Wall -Wextra -Wpedantic -Werror>)
else ()
    add_compile_options($<$<CXX_COMPILER_ID:MSVC>:/Wall>
                        $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Wall -Wextra -Wpedantic>)
endif ()

# Forbid in-source builds
if (PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
    message(FATAL_ERROR "In-source builds not allowed. Make a build directory and run CMake from there.\n")
endif ()

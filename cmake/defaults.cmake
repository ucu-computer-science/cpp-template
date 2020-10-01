# Build release version by default
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif ()


# Conan
if (ENABLE_CONAN)
    include(cmake/conan.cmake)
    conan_cmake_run(CONANFILE conanfile.txt
                    BASIC_SETUP CMAKE_TARGETS
                    BUILD missing)
endif ()


# PVS-Studio
if (ENABLE_PVS_STUDIO)
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
    include(cmake/PVS-Studio.cmake)
endif ()


# Compiler warnings
set(MSVC_WARNINGS /W4)
set(GCC_CLANG_WARNINGS -Wall -Wextra -Wpedantic)

if (WARNINGS_AS_ERRORS)
    set(MSVC_WARNINGS ${MSVC_WARNINGS} /WX)
    set(GCC_CLANG_WARNINGS ${GCC_CLANG_WARNINGS} -Werror)
else ()
    set(GCC_CLANG_WARNINGS ${GCC_CLANG_WARNINGS} -Werror=vla)
endif ()

if (MSVC)
    add_compile_options(${MSVC_WARNINGS})
else ()
    add_compile_options(${GCC_CLANG_WARNINGS})
endif ()


# Sanitizers configuration
if (ENABLE_SANITIZERS)
    set(SANITIZE_UNDEFINED ON)

    # Only one of Memory, Address, or Thread sanitizers is applicable at the time
    set(SANITIZE_MEMORY ON)
#    set(SANITIZE_ADDRESS ON)
#    set(SANITIZE_THREAD ON)

    # Add sanitizers' CMake files to CMake path
    set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/sanitizers" ${CMAKE_MODULE_PATH})

    find_package(Sanitizers)
endif ()


# Set output directories
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)


# Forbid in-source builds
if (PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
    message(FATAL_ERROR "In-source builds not allowed. Make a build directory and run CMake from there.\n")
endif ()

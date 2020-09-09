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


# Compiler warnings
set(MSVC_WARNINGS /Wall)
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


# Add sanitizers' CMake files to CMake path
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/sanitizers" ${CMAKE_MODULE_PATH})


# Forbid in-source builds
if (PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
    message(FATAL_ERROR "In-source builds not allowed. Make a build directory and run CMake from there.\n")
endif ()


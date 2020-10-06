# Options
option(WARNINGS_AS_ERRORS   "Treat compiler warnings as errors."    ON)
option(ENABLE_CONAN         "Use Conan as a package manager."       OFF)
option(ENABLE_PVS_STUDIO    "Use PVS-Studio static code analyzer."  OFF) # Option for the local usage only. PVS-Studio isn't installed on GitHub machines.
option(ENABLE_SANITIZERS    "Use sanitizers to detect errors."      OFF) # Option for the test builds. Do not use it in the production builds.


# Build release version if not specified otherwise.
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif ()


include(cmake/defaults/CompilerWarnings.cmake)
include(cmake/defaults/Conan.cmake)
include(cmake/defaults/Errors.cmake)
include(cmake/defaults/PVSStudio.cmake)
include(cmake/defaults/Sanitizers.cmake)
include(cmake/defaults/Windows.cmake)

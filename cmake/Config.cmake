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

if (ENABLE_PVS_STUDIO)
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
    include(cmake/extra/PVS-Studio.cmake)
    pvs_studio_add_target(TARGET ${PROJECT_NAME}.analyze ALL
                          OUTPUT FORMAT errorfile
                          ANALYZE ${ALL_TARGETS}
                          LOG target.err)
else ()
    message(NOTICE "\nConsider using PVS-Studio with `-DENABLE_PVS_STUDIO=ON` flag or Windows GUI application.\n")
endif ()

if (ENABLE_SANITIZERS)
    set(SANITIZE_UNDEFINED ON)

    # Only one of Memory, Address, or Thread sanitizers is applicable at the time
    set(SANITIZE_MEMORY ON)
#    set(SANITIZE_ADDRESS ON)
#    set(SANITIZE_THREAD ON)

    set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/extra/sanitizers" ${CMAKE_MODULE_PATH})
    find_package(Sanitizers)

    add_sanitizers(${ALL_TARGETS})
endif ()

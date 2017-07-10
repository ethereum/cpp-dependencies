include(ExternalProject)

if (${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten")
    set(Z3_CONFIGURE_PREFIX emconfigure)
endif()

ExternalProject_Add(z3-project
        PREFIX deps/z3
        URL https://github.com/Z3Prover/z3/archive/z3-4.5.0.tar.gz
        URL_HASH SHA256=aeae1d239c5e06ac183be7dd853775b84698db1265cb2258e5918a28372d4a0c
        DOWNLOAD_DIR ${CMAKE_CURRENT_LIST_DIR}/downloads
        SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/z3
        STAMP_DIR ${CMAKE_CURRENT_LIST_DIR}/tmp/z3
        TMP_DIR ${CMAKE_CURRENT_LIST_DIR}/tmp/z3
        BUILD_IN_SOURCE 1
        CONFIGURE_COMMAND ${Z3_CONFIGURE_PREFIX} ./configure --staticlib --noomp --prefix=<INSTALL_DIR>
        BUILD_COMMAND make -C build
        INSTALL_COMMAND make -C build install
        )

ExternalProject_Get_Property(z3-project INSTALL_DIR)
add_library(z3 STATIC IMPORTED)
set(Z3_LIBRARY ${INSTALL_DIR}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}z3${CMAKE_STATIC_LIBRARY_SUFFIX})
set(Z3_INCLUDE_DIR ${INSTALL_DIR}/include)
file(MAKE_DIRECTORY ${Z3_INCLUDE_DIR})  # Must exist.
set_property(TARGET z3 PROPERTY IMPORTED_LOCATION ${Z3_LIBRARY})
set_property(TARGET z3 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${Z3_INCLUDE_DIR})
add_dependencies(z3 z3-project)
unset(INSTALL_DIR)

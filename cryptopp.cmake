include(ExternalProject)
include(GNUInstallDirs)

# Support Emscripten builds by overwritting CMAKE_COMMAND.
if (${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten")
    set(CRYPTOPP_CMAKE_COMMAND emcmake cmake)
else()
    set(CRYPTOPP_CMAKE_COMMAND ${CMAKE_COMMAND})
endif()

ExternalProject_Add(cryptopp-project
        PREFIX deps/cryptopp
        # This points to unreleased version 5.6.5+ but contains very small
        # warning fix:
        # https://github.com/weidai11/cryptopp/commit/903b8feaa70199eb39a313b32a71268745ddb600
        DOWNLOAD_NAME CRYPTOPP_bccc6443.tar.gz
        URL https://github.com/weidai11/cryptopp/archive/bccc6443c4d4d611066c2de4c17109380cf97704.tar.gz
        URL_HASH SHA256=f1fddacadd2a0873f795d5614a85fecd5b6ff1d1c6e21dedc251703c54ce63aa
        # Keep source and archive in under source dir to avoid code duplication
        # for multiple build types and allow injecting the archive in isolated
        # builds (like Ubuntu PPA).
        DOWNLOAD_DIR ${CMAKE_CURRENT_LIST_DIR}/src
        SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/src/cryptopp
        CMAKE_COMMAND ${CRYPTOPP_CMAKE_COMMAND}
        CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
        -DCMAKE_BUILD_TYPE=Release
        # Build static lib but suitable to be included in a shared lib.
        -DCMAKE_POSITION_INDEPENDENT_CODE=On
        -DBUILD_SHARED=Off
        -DBUILD_TESTING=Off
        # Overwtire build and install commands to force Release build on MSVC.
        BUILD_COMMAND cmake --build <BINARY_DIR> --config Release
        INSTALL_COMMAND cmake --build <BINARY_DIR> --config Release --target install
        )

# Create cryptopp imported library
ExternalProject_Get_Property(cryptopp-project INSTALL_DIR)
add_library(cryptopp STATIC IMPORTED)
if (MSVC)
    set(CRYPTOPP_LIBRARY ${INSTALL_DIR}/${CMAKE_INSTALL_LIBDIR}/${CMAKE_STATIC_LIBRARY_PREFIX}cryptopp-static${CMAKE_STATIC_LIBRARY_SUFFIX})
else()
    set(CRYPTOPP_LIBRARY ${INSTALL_DIR}/${CMAKE_INSTALL_LIBDIR}/${CMAKE_STATIC_LIBRARY_PREFIX}cryptopp${CMAKE_STATIC_LIBRARY_SUFFIX})
endif()
set(CRYPTOPP_INCLUDE_DIR ${INSTALL_DIR}/include)
file(MAKE_DIRECTORY ${CRYPTOPP_INCLUDE_DIR})  # Must exist.
set_property(TARGET cryptopp PROPERTY IMPORTED_LOCATION ${CRYPTOPP_LIBRARY})
set_property(TARGET cryptopp PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CRYPTOPP_INCLUDE_DIR})
add_dependencies(cryptopp cryptopp-project)
unset(INSTALL_DIR)

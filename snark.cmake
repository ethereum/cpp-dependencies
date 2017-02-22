include(ExternalProject)
include(GNUInstallDirs)

ExternalProject_Add(snark-project
        PREFIX deps/snark
        # This points to a February version.
        DOWNLOAD_NAME snark.tar.gz
        URL https://github.com/scipr-lab/libsnark/archive/6b7e494c2407eb8e91ad78635788decb2d736596.tar.gz
#        URL_HASH SHA256=f1fddacadd2a0873f795d5614a85fecd5b6ff1d1c6e21dedc251703c54ce63aa
        # Keep source and archive in under source dir to avoid code duplication
        # for multiple build types and allow injecting the archive in isolated
        # builds (like Ubuntu PPA).
        DOWNLOAD_DIR ${CMAKE_CURRENT_LIST_DIR}/downloads
        SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/src/snark
        BUILD_IN_SOURCE 1
        CONFIGURE_COMMAND ""
        BUILD_COMMAND make
            NO_PROCPS=1 STATIC=1 NO_SUPERCOP=1 NO_GTEST=1 NO_DOCS=1 CURVE=ALT_BN128
            FEATUREFLAGS="-DBINARY_OUTPUT=1 -DMONTGOMERY_OUTPUT=1 -DNO_PT_COMPRESSION=1"
            lib PREFIX=<INSTALL_DIR> install
        INSTALL_COMMAND "" #make install PREFIX=<INSTALL_DIR>
        )

# Create snark imported library
ExternalProject_Get_Property(snark-project INSTALL_DIR)
add_library(snark STATIC IMPORTED)
if (MSVC)
    set(SNARK_LIBRARY ${CMAKE_CURRENT_LIST_DIR}/src/snark/${CMAKE_STATIC_LIBRARY_PREFIX}snark-static${CMAKE_STATIC_LIBRARY_SUFFIX})
else()
    set(SNARK_LIBRARY ${CMAKE_CURRENT_LIST_DIR}/src/snark/${CMAKE_STATIC_LIBRARY_PREFIX}snark${CMAKE_STATIC_LIBRARY_SUFFIX})
endif()
set(SNARK_INCLUDE_DIR ${INSTALL_DIR}/include ${INSTALL_DIR}/include/libsnark)
file(MAKE_DIRECTORY ${SNARK_INCLUDE_DIR})  # Must exist.
set_property(TARGET snark PROPERTY IMPORTED_LOCATION ${SNARK_LIBRARY})
set_property(TARGET snark PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${SNARK_INCLUDE_DIR})
add_dependencies(snark snark-project)
unset(INSTALL_DIR)

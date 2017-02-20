include(ExternalProject)
include(GNUInstallDirs)

set(BOOST_CXXFLAGS "")
if (WIN32)
    set(BOOST_BOOTSTRAP_COMMAND bootstrap.bat)
    set(BOOST_BUILD_TOOL b2.exe)
    set(BOOST_LIBRARY_SUFFIX -vc140-mt-1_63.lib)
else()
    set(BOOST_BOOTSTRAP_COMMAND ./bootstrap.sh)
    set(BOOST_BUILD_TOOL ./b2)
    set(BOOST_LIBRARY_SUFFIX .a)
    if (${BUILD_SHARED_LIBS})
        set(BOOST_CXXFLAGS "cxxflags=-fPIC")
    endif()
endif()

ExternalProject_Add(boost-project
        PREFIX deps/boost
        URL https://sourceforge.net/projects/boost/files/boost/1.63.0/boost_1_63_0.tar.gz/download
        URL_HASH SHA256=fe34a4e119798e10b8cc9e565b3b0284e9fd3977ec8a1b19586ad1dec397088b
        DOWNLOAD_DIR ${CMAKE_CURRENT_LIST_DIR}/downloads
        SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/boost
        STAMP_DIR ${CMAKE_CURRENT_LIST_DIR}/tmp/boost
        TMP_DIR ${CMAKE_CURRENT_LIST_DIR}/tmp/boost
        BUILD_IN_SOURCE 1
        CONFIGURE_COMMAND ${BOOST_BOOTSTRAP_COMMAND}
        BUILD_COMMAND ${BOOST_BUILD_TOOL} stage
        ${BOOST_CXXFLAGS}
        threading=multi
        link=static
        variant=release
        address-model=64
        -d0
        --with-chrono
        --with-date_time
        --with-filesystem
        --with-random
        --with-regex
        --with-test
        --with-thread
        INSTALL_COMMAND ""
        )

set(BOOST_INCLUDE_DIR ${CMAKE_CURRENT_LIST_DIR}/boost)
set(BOOST_LIB_DIR ${CMAKE_CURRENT_LIST_DIR}/boost/stage/lib)

add_library(boost::chrono STATIC IMPORTED)
set_property(TARGET boost::chrono PROPERTY IMPORTED_LOCATION ${BOOST_LIB_DIR}/libboost_chrono${BOOST_LIBRARY_SUFFIX})
add_dependencies(boost::chrono boost-project)

add_library(boost::date_time STATIC IMPORTED)
set_property(TARGET boost::date_time PROPERTY IMPORTED_LOCATION ${BOOST_LIB_DIR}/libboost_date_time${BOOST_LIBRARY_SUFFIX})
add_dependencies(boost::date_time boost-project)

add_library(boost::regex STATIC IMPORTED)
set_property(TARGET boost::regex PROPERTY IMPORTED_LOCATION ${BOOST_LIB_DIR}/libboost_regex${BOOST_LIBRARY_SUFFIX})
add_dependencies(boost::regex boost-project)

add_library(boost::system STATIC IMPORTED)
set_property(TARGET boost::system PROPERTY IMPORTED_LOCATION ${BOOST_LIB_DIR}/libboost_system${BOOST_LIBRARY_SUFFIX})
add_dependencies(boost::system boost-project)

add_library(boost::filesystem STATIC IMPORTED)
set_property(TARGET boost::filesystem PROPERTY IMPORTED_LOCATION ${BOOST_LIB_DIR}/libboost_filesystem${BOOST_LIBRARY_SUFFIX})
set_property(TARGET boost::filesystem PROPERTY INTERFACE_LINK_LIBRARIES boost::system)
add_dependencies(boost::filesystem boost-project)

add_library(boost::random STATIC IMPORTED)
set_property(TARGET boost::random PROPERTY IMPORTED_LOCATION ${BOOST_LIB_DIR}/libboost_random${BOOST_LIBRARY_SUFFIX})
add_dependencies(boost::random boost-project)

add_library(boost::unit_test_framework STATIC IMPORTED)
set_property(TARGET boost::unit_test_framework PROPERTY IMPORTED_LOCATION ${BOOST_LIB_DIR}/libboost_unit_test_framework${BOOST_LIBRARY_SUFFIX})
add_dependencies(boost::unit_test_framework boost-project)

add_library(boost::thread STATIC IMPORTED)
set_property(TARGET boost::thread PROPERTY IMPORTED_LOCATION ${BOOST_LIB_DIR}/libboost_thread${BOOST_LIBRARY_SUFFIX})
set_property(TARGET boost::thread PROPERTY INTERFACE_LINK_LIBRARIES boost::chrono boost::date_time boost::regex)
add_dependencies(boost::thread boost-project)

include("${CMAKE_CURRENT_LIST_DIR}/scripts/helpers.cmake")

set(INSTALL_DIR "${ROOT_DIR}/install")
set(SERVER "https://github.com/ethereum/cpp-dependencies/releases/download/vc140/")

function(download_and_install PACKAGE_NAME)
    download_and_unpack("${SERVER}${PACKAGE_NAME}.tar.gz" ${INSTALL_DIR})
endfunction(download_and_install)


download_and_install("boost-1.61")
download_and_install("cryptopp-5.6.2")
download_and_install("curl-7.4.2")
download_and_install("json-rpc-cpp-0.5.0")
download_and_install("jsoncpp-1.6.2")
download_and_install("opencl-icd-loader-0.0")
download_and_install("leveldb-1.2")
download_and_install("llvm-3.8.0")
download_and_install("microhttpd-0.9.2")
download_and_install("miniupnpc-1.9")
download_and_install("qt-5.6")

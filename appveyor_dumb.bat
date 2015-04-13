:: just to check if appveyor build fails due to random reasons

call build_jsoncpp.bat
call bundle_jsoncpp.bat
call build_microhttpd.bat
call bundle_microhttpd.bat
call build_curl.bat
call bundle_curl.bat
call build_jsonrpccpp.bat
call bundle_jsonrpccpp.bat


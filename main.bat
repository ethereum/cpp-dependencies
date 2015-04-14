REM add MSBuild to env variable
set MSBuild="c:/Program Files (x86)/MSBuild/12.0/bin/msbuild.exe"

REM add vcvars32.bat to PATH
@set PATH=c:/Program Files (x86)/Microsoft Visual Studio 12.0/VC/bin;%PATH%

REM create build, package && install directory
if not exist build mkdir build
if not exist package mkdir package
if not exist install mkdir install

set PLATFORM=Win32 & set CONFIGURATION=Debug   & call build_jsoncpp.bat     & call bundle_jsoncpp.bat || goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & call build_jsoncpp.bat     & call bundle_jsoncpp.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & call build_jsoncpp.bat     & call bundle_jsoncpp.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & call build_jsoncpp.bat     & call bundle_jsoncpp.bat || goto :error
call install_jsoncpp.bat || goto :error

set PLATFORM=Win32 & set CONFIGURATION=Debug   & call build_microhttpd.bat  & call bundle_microhttpd.bat || goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & call build_microhttpd.bat  & call bundle_microhttpd.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & call build_microhttpd.bat  & call bundle_microhttpd.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & call build_microhttpd.bat  & call bundle_microhttpd.bat || goto :error
call install_microhttpd.bat || goto :error

set PLATFORM=Win32 & set CONFIGURATION=Debug   & call build_curl.bat        & call bundle_curl.bat goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & call build_curl.bat        & call bundle_curl.bat goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & call build_curl.bat        & call bundle_curl.bat goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & call build_curl.bat        & call bundle_curl.bat goto :error
call install_curl.bat || goto :error

set PLATFORM=Win32 & set CONFIGURATION=Debug   & call build_jsonrpccpp.bat  & call bundle_jsonrpccpp.bat goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & call build_jsonrpccpp.bat  & call bundle_jsonrpccpp.bat goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & call build_jsonrpccpp.bat  & call bundle_jsonrpccpp.bat goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & call build_jsonrpccpp.bat  & call bundle_jsonrpccpp.bat goto :error
call install_jsonrpccpp.bat || goto :error

set PLATFORM=Win32 & set CONFIGURATION=Debug   & call build_leveldb.bat     & call bundle_leveldb.bat goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & call build_leveldb.bat     & call bundle_leveldb.bat goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & call build_leveldb.bat     & call bundle_leveldb.bat goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & call build_leveldb.bat     & call bundle_leveldb.bat goto :error
call install_leveldb.bat || goto :error

set PLATFORM=Win32 & set CONFIGURATION=Debug   & call build_cryptopp.bat    & call bundle_cryptopp.bat goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & call build_cryptopp.bat    & call bundle_cryptopp.bat goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & call build_cryptopp.bat    & call bundle_cryptopp.bat goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & call build_cryptopp.bat    & call bundle_cryptopp.bat goto :error
call install_cryptopp.bat || goto :error

set PLATFORM=Win32 & call build_boost.bat
set PLATFORM=x64 & call build_boost.bat

goto :EOF

:error
echo Failed with error %errorlevel%
exit /b %errorlevel%

:EOF


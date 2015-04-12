REM add MSBuild to env variable
set MSBuild="c:/Program Files (x86)/MSBuild/12.0/bin/msbuild.exe"

REM create build directory
if not exist build mkdir build

set PLATFORM=Win32 & set CONFIGURATION=Debug   & call jsoncpp.bat || goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & call jsoncpp.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & call jsoncpp.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & call jsoncpp.bat || goto :error

set PLATFORM=Win32 & set CONFIGURATION=Debug   & call curl.bat || goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & call curl.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & call curl.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & call curl.bat || goto :error

set PLATFORM=Win32 & set CONFIGURATION=Debug   & call microhttpd.bat || goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & call microhttpd.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & call microhttpd.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & call microhttpd.bat || goto :error

goto :EOF

:error
echo Failed with error %errorlevel%
exit /b %errorlevel%

:EOF


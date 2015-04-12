REM add MSBuild to env variable
set MSBuild:="\"c:/Program Files (x86)/MSBuild/12.0/bin/msbuild.exe\"";%MSBuild%

REM create build directory
mkdir build

set PLATFORM=Win32 & set CONFIGURATION=Debug   & jsoncpp.bat || goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & jsoncpp.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & jsoncpp.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & jsoncpp.bat || goto :error

:goto :EOF

:error
echo Failed with error %errorlevel%
exit /b %errorlevel%


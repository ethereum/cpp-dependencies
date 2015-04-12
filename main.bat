REM create directories
REM build dir will be used to downlaod && build dependencies

mkdir build

set PLATFORM=Win32 & set CONFIGURATION=Debug   & jsoncpp.bat || goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & jsoncpp.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & jsoncpp.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & jsoncpp.bat || goto :error

:goto :EOF

:error
echo Failed with error %errorlevel%
exit /b %errorlevel%


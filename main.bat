REM create directories
REM build dir will be used to downlaod && build dependencies

mkdir build

jsoncpp.bat || goto :error


:goto :EOF

:error
echo Failed with error %errorlevel%
exit /b %errorlevel%

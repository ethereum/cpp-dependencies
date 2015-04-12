REM clone microhttpd
if not exist build\microhttpd git clone -q https://github.com/debris/libmicrohttpd build\microhttpd
cd build\microhttpd\w32\VS2013
git checkout -qf 55e4a9221ce5a70a254e0e55e89c4564df2c3b42

REM build microhttpd
%MSBuild% libmicrohttpd.sln /property:Configuration=%CONFIGURATION% /property:Platform=%PLATFORM% /target:libmicrohttpd /verbosity:minimal

REM microhttpd built
cd ..\..\..\..


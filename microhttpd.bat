REM clone microhttpd
if not exist build\microhttpd git clone -q https://github.com/debris/libmicrohttpd build\microhttpd
cd build\microhttpd\w32\VS2013
git checkout -qf c50fc886e7c7ebc410e7634db0c9d62bc230df77 

REM build microhttpd
%MSBuild% libmicrohttpd.sln /property:Configuration=%CONFIGURATION% /property:Platform=%PLATFORM% /target:libmicrohttpd /verbosity:minimal

REM curl built
cd ..\..\..\..


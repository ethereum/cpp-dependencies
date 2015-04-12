REM clone microhttpd
if not exist build\microhttpd git clone -q https://github.com/debris/libmicrohttpd build\microhttpd
cd build\microhttpd\w32\VS2013
git checkout -qf 55e4a9221ce5a70a254e0e55e89c4564df2c3b42

REM build microhttpd
%MSBuild% libmicrohttpd.sln /property:Configuration=%CONFIGURATION% /property:Platform=%PLATFORM% /target:libmicrohttpd /verbosity:minimal

REM microhttpd built
cd ..\..\..\..

REM packaging microhttpd
if not exist package\microhttpd mkdir package\microhttpd
if not exist package\microhttpd\lib mkdir package\microhttpd\lib
if not exist package\microhttpd\bin mkdir package\microhttpd\bin
if not exist package\microhttpd\include mkdir package\microhttpd\include

cd package\microhttpd\lib

cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll.exp .
cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll.lib .
cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll.pdb .

cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll_d.exp .
cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll_d.ilk .
cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll_d.lib .
cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll_d.pdb .

cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll.exp libmicrohttpd-dll_x64.exp 
cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll.lib libmicrohttpd-dll_x64.lib
cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll.pdb libmicrohttpd-dll_x64.pdb

cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll_d.exp libmicrohttpd-dll_d_x64.exp
cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll_d.ilk libmicrohttpd-dll_d_x64.ilk
cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll_d.lib libmicrohttpd-dll_d_x64.lib
cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll_d.pdb libmicrohttpd-dll_d_x64.pdb

cd ..\bin

cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll.dll .
cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll_d.dll .

cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll.dll libmicrohttpd-dll_x64.dll
cmake -E copy ..\..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll_d.dll libmicrohttpd-dll_d_x64.dll

cd ..\..\..
cmake -E copy build\microhttpd\w32\VS2013\Output\microhttpd.h package\microhttpd\include
REM microhttpd packaged

REM installing microhttpd
cmake -E copy_directory package\microhttpd install


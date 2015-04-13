REM clone leveldb
if not exist build\leveldb git clone -q https://github.com/debris/leveldb build\leveldb
cd build\leveldb\win
git checkout -qf 189e628b2d4024639927a7f94f87e13d3d9f5284

REM create leveldb build dirs
if %PLATFORM% == Win32 if not exist build mkdir build
if %PLATFORM% == Win32 cd build
if %PLATFORM% == x64 if not exist build64 mkdir build64
if %PLATFORM% == x64 cd build64

REM build leveldb
%MSBuild% LibLevelDB.sln /property:Configuration=%CONFIGURATION% /property:Platform=%PLATFORM% /target:LibLevelDB /verbosity:minimal

REM leveldb built
cd ..\..\..


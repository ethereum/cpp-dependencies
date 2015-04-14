REM packaging leveldb
if not exist package\leveldb mkdir package\leveldb
if not exist package\leveldb\%PLATFORM% mkdir package\leveldb\%PLATFORM%
if not exist package\leveldb\lib\%PLATFORM% mkdir package\leveldb\lib\%PLATFORM%
if not exist package\leveldb\include\%PLATFORM% mkdir package\leveldb\include\%PLATFORM%

cd package\leveldb\%PLATFORM%

if %PLATFORM% == Win32 (
    if %CONFIGURATION% == Release cmake -E copy ..\..\..\build\leveldb\win\Release\LibLevelDB.lib lib\leveldb.lib
    if %CONFIGURATION% == Debug cmake -E copy ..\..\..\build\leveldb\win\Debug\LibLevelDB.lib lib\leveldbd.lib
)

if %PLATFORM% == x64 (
    if %CONFIGURATION% == Release cmake -E copy ..\..\..\build\leveldb\win\x64\Release\LibLevelDB.lib lib\leveldb.lib
    if %CONFIGURATION% == Debug cmake -E copy ..\..\..\build\leveldb\win\x64\Debug\LibLevelDB.lib lib\leveldbd.lib
)

cmake -E copy_directory ..\..\..\build\leveldb\include include
cd ..\..\..


REM packaging leveldb
if not exist package\leveldb mkdir package\leveldb
if not exist package\leveldb\lib mkdir package\leveldb\lib
if not exist package\leveldb\include mkdir package\leveldb\include

cd package\leveldb

if %PLATFORM% == Win32 (
    if %CONFIGURATION% == Release cmake -E copy ..\..\build\leveldb\win\Release\LibLevelDB.lib lib\leveldb.lib
    if %CONFIGURATION% == Debug cmake -E copy ..\..\build\leveldb\win\Debug\LibLevelDB.lib lib\leveldbd.lib
)

if %PLATFORM% == x64 (
    if %CONFIGURATION% == Release cmake -E copy ..\..\build\leveldb\win\x64\Release\LibLevelDB.lib lib\leveldb_x64.lib
    if %CONFIGURATION% == Debug cmake -E copy ..\..\build\leveldb\win\x64\Debug\LibLevelDB.lib lib\leveldbd_x64.lib
)

cmake -E copy_directory ..\..\build\leveldb\include include
cd ..\..


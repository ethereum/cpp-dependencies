REM packaging jsoncpp
if not exist package\jsoncpp mkdir package\jsoncpp
if not exist package\jsoncpp\lib mkdir package\jsoncpp\lib
if not exist package\jsoncpp\include mkdir package\jsoncpp\include
if not exist package\jsoncpp\include\json mkdir package\jsoncpp\include\json

cd package\jsoncpp

if %PLATFORM% == Win32 (
    if %CONFIGURATION% == Release cmake -E copy ..\..\build\jsoncpp\build\src\lib_json\Release\jsoncpp.lib lib\jsoncpp.lib
    if %CONFIGURATION% == Debug cmake -E copy ..\..\build\jsoncpp\build\src\lib_json\Debug\jsoncpp.lib lib\jsoncppd.lib
)

if %PLATFORM% == x64 (
    if %CONFIGURATION% == Release cmake -E copy ..\..\build\jsoncpp\build64\src\lib_json\Release\jsoncpp.lib lib\jsoncpp_x64.lib
    if %CONFIGURATION% == Debug cmake -E copy ..\..\build\jsoncpp\build64\src\lib_json\Debug\jsoncpp.lib lib\jsoncppd_x64.lib
)

cmake -E copy_directory ..\..\build\jsoncpp\include\json include\json
cd ..\..


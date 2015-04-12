REM packaging jsoncpp
if not exist package\jsoncpp mkdir package\jsoncpp
if not exist package\jsoncpp\lib mkdir package\jsoncpp\lib
if not exist package\jsoncpp\include mkdir package\jsoncpp\include
if not exist package\jsoncpp\include\json mkdir package\jsoncpp\include\json

cd package\jsoncpp\lib

cmake -E copy ..\..\..\build\jsoncpp\build\src\lib_json\Release\jsoncpp.lib .
cmake -E copy ..\..\..\build\jsoncpp\build\src\lib_json\Debug\jsoncpp.lib jsoncppd.lib

cmake -E copy ..\..\..\build\jsoncpp\build64\src\lib_json\Release\jsoncpp.lib jsoncpp_x64.lib
cmake -E copy ..\..\..\build\jsoncpp\build64\src\lib_json\Debug\jsoncpp.lib jsoncppd_x64.lib

cd ..\..\..
cmake -E copy_directory build\jsoncpp\include\json package\jsoncpp\include\json
REM jsoncpp packaged

REM installing jsoncpp
cmake -E copy_directory package\jsoncpp install


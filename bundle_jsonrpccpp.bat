REM packaging jsonrpccpp
if not exist package\jsonrpccpp mkdir package\jsonrpccpp
if not exist package\jsonrpccpp\lib mkdir package\jsonrpccpp\lib
if not exist package\jsonrpccpp\include mkdir package\jsonrpccpp\include

cd package\jsonrpccpp

if %PLATFORM% == Win32 (
    if %CONFIGURATION% == Release (
        cmake -E copy ..\..\build\jsonrpccpp\build\lib\Release\jsonrpccpp-common.lib lib\jsonrpccpp-common.lib
        cmake -E copy ..\..\build\jsonrpccpp\build\lib\Release\jsonrpccpp-client.lib lib\jsonrpccpp-client.lib
        cmake -E copy ..\..\build\jsonrpccpp\build\lib\Release\jsonrpccpp-server.lib lib\jsonrpccpp-server.lib
    )
    
    if %CONFIGURATION% == Debug (
        cmake -E copy ..\..\build\jsonrpccpp\build\lib\Debug\jsonrpccpp-common.lib lib\jsonrpccpp-commond.lib
        cmake -E copy ..\..\build\jsonrpccpp\build\lib\Debug\jsonrpccpp-client.lib lib\jsonrpccpp-clientd.lib
        cmake -E copy ..\..\build\jsonrpccpp\build\lib\Debug\jsonrpccpp-server.lib lib\jsonrpccpp-serverd.lib
    )
)

if %PLATFORM% == x64 (
    if %CONFIGURATION% == Release (
        cmake -E copy ..\..\build\jsonrpccpp\build64\lib\Release\jsonrpccpp-common.lib lib\jsonrpccpp-common_x64.lib
        cmake -E copy ..\..\build\jsonrpccpp\build64\lib\Release\jsonrpccpp-client.lib lib\jsonrpccpp-client_x64.lib
        cmake -E copy ..\..\build\jsonrpccpp\build64\lib\Release\jsonrpccpp-server.lib lib\jsonrpccpp-server_x64.lib
    )
    
    if %CONFIGURATION% == Debug (
        cmake -E copy ..\..\build\jsonrpccpp\build64\lib\Debug\jsonrpccpp-common.lib lib\jsonrpccpp-commond_x64.lib
        cmake -E copy ..\..\build\jsonrpccpp\build64\lib\Debug\jsonrpccpp-client.lib lib\jsonrpccpp-clientd_x64.lib
        cmake -E copy ..\..\build\jsonrpccpp\build64\lib\Debug\jsonrpccpp-server.lib lib\jsonrpccpp-serverd_x64.lib
    )
)

cd ..\..


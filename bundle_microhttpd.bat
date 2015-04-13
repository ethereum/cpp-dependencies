REM packaging microhttpd
if not exist package\microhttpd mkdir package\microhttpd
if not exist package\microhttpd\lib mkdir package\microhttpd\lib
if not exist package\microhttpd\bin mkdir package\microhttpd\bin
if not exist package\microhttpd\include mkdir package\microhttpd\include

cd package\microhttpd

if %PLATFORM% == Win32 (
    if %CONFIGURATION% == Release (
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll.dll bin\libmicrohttpd-dll.dll
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll.exp lib\libmicrohttpd-dll.exp
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll.lib lib\libmicrohttpd-dll.lib
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll.pdb lib\libmicrohttpd-dll.pdb
    )

    if %CONFIGURATION% == Debug (
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll_d.dll bin\libmicrohttpd-dll_d.dll
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll_d.exp lib\libmicrohttpd-dll_d.exp
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll_d.ilk lib\libmicrohttpd-dll_d.ilk
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll_d.lib lib\libmicrohttpd-dll_d.lib
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\libmicrohttpd-dll_d.pdb lib\libmicrohttpd-dll_d.pdb
    )

    cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\microhttpd.h include\microhttpd.h
)

if %PLATFORM% == x64 (
    if %CONFIGURATION% == Release (
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll.dll bin\libmicrohttpd-dll_x64.dll
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll.exp lib\libmicrohttpd-dll_x64.exp 
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll.lib lib\libmicrohttpd-dll_x64.lib
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll.pdb lib\libmicrohttpd-dll_x64.pdb
    )

    if %CONFIGURATION% == Debug (
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll_d.dll bin\libmicrohttpd-dll_d_x64.dll
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll_d.exp lib\libmicrohttpd-dll_d_x64.exp
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll_d.ilk lib\libmicrohttpd-dll_d_x64.ilk
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll_d.lib lib\libmicrohttpd-dll_d_x64.lib
        cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\x64\libmicrohttpd-dll_d.pdb lib\libmicrohttpd-dll_d_x64.pdb
    )

    cmake -E copy ..\..\build\microhttpd\w32\VS2013\Output\x64\microhttpd.h include\microhttpd.h
)

cd ..\..


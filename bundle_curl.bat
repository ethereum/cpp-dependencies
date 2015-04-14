REM packaging curl
if not exist package\curl mkdir package\curl

if not exist package\curl\Win32 mkdir package\curl\Win32
if not exist package\curl\Win32\lib mkdir package\curl\Win32\lib
if not exist package\curl\Win32\bin mkdir package\curl\Win32\bin
if not exist package\curl\Win32\include mkdir package\curl\Win32\include
if not exist package\curl\Win32\include\curl mkdir package\curl\Win32\include\curl

if not exist package\curl\x64 mkdir package\curl\x64
if not exist package\curl\x64\lib mkdir package\curl\x64\lib
if not exist package\curl\x64\bin mkdir package\curl\x64\bin
if not exist package\curl\x64\include mkdir package\curl\x64\include
if not exist package\curl\x64\include\curl mkdir package\curl\x64\include\curl

cd package\curl

if %PLATFORM% == Win32 (
    if %CONFIGURATION% == Release (
        cmake -E copy ..\..\build\curl\build\lib\Release\libcurl.dll Win32\bin\libcurl.dll
        cmake -E copy ..\..\build\curl\build\lib\Release\libcurl_imp.exp Win32\lib\libcurl.exp
        cmake -E copy ..\..\build\curl\build\lib\Release\libcurl_imp.lib Win32\lib\libcurl.lib
    )

    if %CONFIGURATION% == Debug (
        cmake -E copy ..\..\build\curl\build\lib\Debug\libcurl.dll Win32\bin\libcurld.dll
        cmake -E copy ..\..\build\curl\build\lib\Debug\libcurl.ilk Win32\lib\libcurld.ilk
        cmake -E copy ..\..\build\curl\build\lib\Debug\libcurl.pdb Win32\lib\libcurld.pdb
        cmake -E copy ..\..\build\curl\build\lib\Debug\libcurl_imp.exp Win32\lib\libcurld.exp
        cmake -E copy ..\..\build\curl\build\lib\Debug\libcurl_imp.lib Win32\lib\libcurld.lib
    )

    cmake -E copy_directory ..\..\build\curl\include\curl Win32\include\curl
    cmake -E copy ..\..\build\curl\build\include\curl\curlbuild.h Win32\include\curl\curlbuild.h
)

if %PLATFORM% == x64 (
    if %CONFIGURATION% == Release (
        cmake -E copy ..\..\build\curl\build64\lib\Release\libcurl.dll x64\bin\libcurl.dll
        cmake -E copy ..\..\build\curl\build64\lib\Release\libcurl_imp.exp x64\lib\libcurl.exp
        cmake -E copy ..\..\build\curl\build64\lib\Release\libcurl_imp.lib x64\lib\libcurl.lib
    )

    if %CONFIGURATION% == Debug (
        cmake -E copy ..\..\build\curl\build64\lib\Debug\libcurl.dll x64\bin\libcurld.dll
        cmake -E copy ..\..\build\curl\build64\lib\Debug\libcurl.ilk x64\lib\libcurld.ilk
        cmake -E copy ..\..\build\curl\build64\lib\Debug\libcurl.pdb x64\lib\libcurld.pdb
        cmake -E copy ..\..\build\curl\build64\lib\Debug\libcurl_imp.exp x64\lib\libcurld.exp
        cmake -E copy ..\..\build\curl\build64\lib\Debug\libcurl_imp.lib x64\lib\libcurld.lib
    )

    cmake -E copy_directory ..\..\build\curl\include\curl x64\include\curl
    cmake -E copy ..\..\build\curl\build64\include\curl\curlbuild.h x64\include\curl\curlbuild.h
)

cd ..\..


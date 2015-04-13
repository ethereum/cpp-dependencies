REM packaging curl
if not exist package\curl mkdir package\curl
if not exist package\curl\lib mkdir package\curl\lib
if not exist package\curl\bin mkdir package\curl\bin
if not exist package\curl\include mkdir package\curl\include
if not exist package\curl\include\curl mkdir package\curl\include\curl

cd package\curl

if %PLATFORM% == Win32 (
    if %CONFIGURATION% == Release (
        cmake -E copy ..\..\build\curl\build\lib\Release\libcurl.dll bin\libcurl.dll
        cmake -E copy ..\..\build\curl\build\lib\Release\libcurl_imp.exp lib\libcurl.exp
        cmake -E copy ..\..\build\curl\build\lib\Release\libcurl_imp.lib lib\libcurl.lib
    )

    if %CONFIGURATION% == Debug (
        cmake -E copy ..\..\build\curl\build\lib\Debug\libcurl.dll bin\libcurld.dll
        cmake -E copy ..\..\build\curl\build\lib\Debug\libcurl.ilk lib\libcurld.ilk
        cmake -E copy ..\..\build\curl\build\lib\Debug\libcurl.pdb lib\libcurld.pdb
        cmake -E copy ..\..\build\curl\build\lib\Debug\libcurl_imp.exp lib\libcurld.exp
        cmake -E copy ..\..\build\curl\build\lib\Debug\libcurl_imp.lib lib\libcurld.lib
    )

    cmake -E copy ..\..\build\curl\build\include\curl\curlbuild.h include\curl\curlbuild.h
)

if %PLATFORM% == x64 (
    if %CONFIGURATION% == Release (
        cmake -E copy ..\..\build\curl\build64\lib\Release\libcurl.dll bin\libcurl_x64.dll
        cmake -E copy ..\..\build\curl\build64\lib\Release\libcurl_imp.exp lib\libcurl_x64.exp
        cmake -E copy ..\..\build\curl\build64\lib\Release\libcurl_imp.lib lib\libcurl_x64.lib
    )

    if %CONFIGURATION% == Debug (
        cmake -E copy ..\..\build\curl\build64\lib\Debug\libcurl.dll bin\libcurld_x64.dll
        cmake -E copy ..\..\build\curl\build64\lib\Debug\libcurl.ilk lib\libcurld_x64.ilk
        cmake -E copy ..\..\build\curl\build64\lib\Debug\libcurl.pdb lib\libcurld_x64.pdb
        cmake -E copy ..\..\build\curl\build64\lib\Debug\libcurl_imp.exp lib\libcurld_x64.exp
        cmake -E copy ..\..\build\curl\build64\lib\Debug\libcurl_imp.lib lib\libcurld_x64.lib
    )

    cmake -E copy ..\..\build\curl\build64\include\curl\curlbuild.h include\curl\curlbuild.h
)

cmake -E copy_directory ..\..\build\curl\include\curl include\curl
cd ..\..

REM zipping curl
cd package
cmake -E rename curl curl-7.4.2
tar -zcvf curl-7.4.2.tar.gz curl-7.4.2
cd ..

REM installing curl
cmake -E copy_directory package\curl-7.4.2 install


REM packaging curl
if not exist package\curl mkdir package\curl
if not exist package\curl\lib mkdir package\curl\lib
if not exist package\curl\bin mkdir package\curl\bin
if not exist package\curl\include mkdir package\curl\include
if not exist package\curl\include\curl mkdir package\curl\include\curl

cd package\curl\lib

cmake -E copy ..\..\..\build\curl\build\lib\Release\libcurl_imp.exp libcurl.exp
cmake -E copy ..\..\..\build\curl\build\lib\Release\libcurl_imp.lib libcurl.lib

cmake -E copy ..\..\..\build\curl\build\lib\Debug\libcurl.ilk libcurld.ilk
cmake -E copy ..\..\..\build\curl\build\lib\Debug\libcurl.pdb libcurld.pdb
cmake -E copy ..\..\..\build\curl\build\lib\Debug\libcurl_imp.exp libcurld.exp
cmake -E copy ..\..\..\build\curl\build\lib\Debug\libcurl_imp.lib libcurld.lib

cmake -E copy ..\..\..\build\curl\build64\lib\Release\libcurl_imp.exp libcurl_x64.exp
cmake -E copy ..\..\..\build\curl\build64\lib\Release\libcurl_imp.lib libcurl_x64.lib

cmake -E copy ..\..\..\build\curl\build64\lib\Debug\libcurl.ilk libcurld_x64.ilk
cmake -E copy ..\..\..\build\curl\build64\lib\Debug\libcurl.pdb libcurld_x64.pdb
cmake -E copy ..\..\..\build\curl\build64\lib\Debug\libcurl_imp.exp libcurld_x64.exp
cmake -E copy ..\..\..\build\curl\build64\lib\Debug\libcurl_imp.lib libcurld_x64.lib

cd ..\bin

cmake -E copy ..\..\..\build\curl\build\lib\Release\libcurl.dll libcurl.dll
cmake -E copy ..\..\..\build\curl\build\lib\Debug\libcurl.dll libcurld.dll

cmake -E copy ..\..\..\build\curl\build\lib\Release\libcurl.dll libcurl_x64.dll
cmake -E copy ..\..\..\build\curl\build\lib\Debug\libcurl.dll libcurld_x64.dll

cd ..\..\..
cmake -E copy_directory build\curl\include\curl package\curl\include\curl
REM curl packaged

REM installing curl
cmake -E copy_directory package\curl install


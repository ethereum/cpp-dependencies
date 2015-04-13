REM packaging cryptopp
if not exist package\cryptopp mkdir package\cryptopp
if not exist package\cryptopp\lib mkdir package\cryptopp\lib
if not exist package\cryptopp\include mkdir package\cryptopp\include
if not exist package\cryptopp\include\cryptopp mkdir package\cryptopp\include\cryptopp

cd package\cryptopp

if %PLATFORM% == Win32 (
    if %CONFIGURATION% == Release cmake -E copy ..\..\build\cryptopp\win\Release\LibCryptoPP.lib lib\cryptopp.lib
    if %CONFIGURATION% == Debug cmake -E copy ..\..\build\cryptopp\win\Debug\LibCryptoPP.lib lib\cryptoppd.lib
)

if %PLATFORM% == x64 (
    if %CONFIGURATION% == Release cmake -E copy ..\..\build\cryptopp\win\x64\Release\LibCryptoPP.lib lib\cryptopp_x64.lib
    if %CONFIGURATION% == Debug cmake -E copy ..\..\build\cryptopp\win\x64\Debug\LibCryptoPP.lib lib\cryptoppd_x64.lib
)

xcopy ..\..\build\cryptopp\*.h include\cryptopp /sy

cd ..\..

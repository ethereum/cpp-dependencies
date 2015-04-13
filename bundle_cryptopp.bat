REM packaging cryptopp
if not exist package\cryptopp mkdir package\cryptopp
if not exist package\cryptopp\lib mkdir package\cryptopp\lib
if not exist package\cryptopp\include mkdir package\cryptopp\include

cd package\cryptopp

if %PLATFORM% == Win32 (
    if %CONFIGURATION% == Release cmake -E copy ..\..\build\cryptopp\win\Release\LibCryptopPP.lib lib\cryptopp.lib
    if %CONFIGURATION% == Debug cmake -E copy ..\..\build\cryptopp\win\Debug\LibCryptopPP.lib lib\cryptoppd.lib
)

if %PLATFORM% == x64 (
    if %CONFIGURATION% == Release cmake -E copy ..\..\build\cryptopp\win\x64\Release\LibCryptopPP.lib lib\cryptopp_x64.lib
    if %CONFIGURATION% == Debug cmake -E copy ..\..\build\cryptopp\win\x64\Debug\LibCryptopPP.lib lib\cryptoppd_x64.lib
)

cmake -E copy_directory ..\..\build\cryptopp\include include
cd ..\..


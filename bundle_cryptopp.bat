REM packaging cryptopp
if not exist package\cryptopp mkdir package\cryptopp
if not exist package\cryptopp\Win32 mkdir package\cryptopp\Win32
if not exist package\cryptopp\x64 mkdir package\cryptopp\x64

if not exist package\cryptopp\Win32\lib mkdir package\cryptopp\Win32\lib
if not exist package\cryptopp\Win32\include mkdir package\cryptopp\Win32\include
if not exist package\cryptopp\Win32\include\cryptopp mkdir package\cryptopp\Win32\include\cryptopp

if not exist package\cryptopp\x64\lib mkdir package\cryptopp\x64\lib
if not exist package\cryptopp\x64\include mkdir package\cryptopp\x64\include
if not exist package\cryptopp\x64\include\cryptopp mkdir package\cryptopp\x64\include\cryptopp

cd package\cryptopp

if %PLATFORM% == Win32 (
    if %CONFIGURATION% == Release cmake -E copy ..\..\build\cryptopp\win\Release\LibCryptoPP.lib Win32\lib\cryptopp.lib
    if %CONFIGURATION% == Debug cmake -E copy ..\..\build\cryptopp\win\Debug\LibCryptoPP.lib Win32\lib\cryptoppd.lib
    xcopy ..\..\build\cryptopp\*.h Win32\include\cryptopp /sy
)

if %PLATFORM% == x64 (
    if %CONFIGURATION% == Release cmake -E copy ..\..\build\cryptopp\win\x64\Release\LibCryptoPP.lib x64\lib\cryptopp.lib
    if %CONFIGURATION% == Debug cmake -E copy ..\..\build\cryptopp\win\x64\Debug\LibCryptoPP.lib x64\lib\cryptoppd.lib
    xcopy ..\..\build\cryptopp\*.h x64\include\cryptopp /sy
)

cd ..\..


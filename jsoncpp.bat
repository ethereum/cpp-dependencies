REM clone jsoncpp

git clone -q https://github.com/debris/jsoncpp build\jsoncpp 
cd build\jsoncpp
git checkout -qf 24c0054c10e62e8359c0f96372dfa183de90f93c

REM create jsoncpp build dirs
if %PLATFORM% == Win32 mkdir build
if %PLATFORM% == Win32 cd build
if %PLATFORM% == x64 mkdir buildx64
if %PLATFORM% == x64 cd buildx64

REM run jsoncpp cmake
if %PLATFORM% == Win32 cmake ..
if %PLATFORM% == x64 cmake -G "Visual Studio 12 2013 Win64" ..

REM build jsoncpp
%MSBuild% jsoncpp.sln /property:Configuration=Debug /property:Platform=x64

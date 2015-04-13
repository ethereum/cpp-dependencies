REM clone leveldb
if not exist build\leveldb git clone -q https://github.com/debris/leveldb build\leveldb
cd build\leveldb\win
git checkout -qf 189e628b2d4024639927a7f94f87e13d3d9f5284

REM build leveldb
%MSBuild% LibLevelDB.sln /property:Configuration=%CONFIGURATION% /property:Platform=%PLATFORM% /verbosity:minimal

REM leveldb built
cd ..\..\..


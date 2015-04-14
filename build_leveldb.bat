REM clone leveldb
if not exist build\leveldb git clone -q https://github.com/debris/leveldb build\leveldb
cd build\leveldb\win
git checkout -qf f778144af3b38149e8b86370cbf4509c62233902

REM build leveldb
%MSBuild% LibLevelDB.sln /property:Configuration=%CONFIGURATION% /property:Platform=%PLATFORM% /verbosity:minimal

REM leveldb built
cd ..\..\..


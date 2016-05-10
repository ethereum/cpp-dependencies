REM clone leveldb
if not exist build\leveldb git clone -q https://github.com/ethereum/leveldb.git build\leveldb
cd build\leveldb
git checkout -qf 5845e880be6d912ef260fab26403ed78ff1e637d
cd win

REM build leveldb
%MSBuild% LevelDB.sln /property:Configuration=%CONFIGURATION% /property:Platform=%PLATFORM% /verbosity:minimal

REM leveldb built
cd ..\..\..


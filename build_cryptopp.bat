REM clone cryptopp
if not exist build\cryptopp git clone -q https://github.com/debris/cryptopp build\cryptopp
cd build\cryptopp\win
git checkout -qf 5e1491aed4264cbb847ef493cd0e6cfff7f052bb 

REM build cryptopp
%MSBuild% LibLevelDB.sln /property:Configuration=%CONFIGURATION% /property:Platform=%PLATFORM% /verbosity:minimal

REM cryptopp built
cd ..\..\..


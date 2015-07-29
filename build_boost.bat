REM download boost
if not exist build\boost mkdir build\boost

cd build\boost

if not exist boost (
    curl -o boost_1_55_0.tar.gz -L http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.gz/download
    tar -zxvf boost_1_55_0.tar.gz
    cmake -E rename boost_1_55_0 boost
)

cd boost

REM build boost
if not exist b2.exe call bootstrap.bat

if not exist "stage/%PLATFORM%" (
    if %PLATFORM% == Win32 b2.exe -j4 --build-type=complete link=static runtime-link=shared variant=debug,release threading=multi --with-filesystem --with-system --with-thread --with-date_time --with-regex --with-test --with-program_options --with-random stage
    if %PLATFORM% == x64 b2.exe -j4 --build-type=complete link=static runtime-link=shared variant=debug,release threading=multi address-model=64 --with-filesystem --with-system --with-thread --with-date_time --with-regex --with-test --with-program_options --with-random stage
    cmake -E rename stage/lib stage/%PLATFORM%
)

cd ..\..\..

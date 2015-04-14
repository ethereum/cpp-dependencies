REM packaging boost
if not exist package\boost mkdir package\boost

if not exist package\boost\%PLATFORM% mkdir package\boost\%PLATFORM%
if not exist package\boost\%PLATFORM%\lib mkdir package\boost\%PLATFORM%\lib
if not exist package\boost\%PLATFORM%\include mkdir package\boost\%PLATFORM%\include
if not exist package\boost\%PLATFORM%\include\boost mkdir package\boost\%PLATFORM%\include\boost

cd package\boost\%PLATFORM%

cmake -E copy_directory ..\..\..\build\boost\boost\boost include\boost
cmake -E copy_directory ..\..\..\build\boost\boost\stage\%PLATFORM% lib

cd ..\..\..


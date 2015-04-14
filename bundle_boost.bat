REM packaging boost
if not exist package\boost mkdir package\boost

if not exist package\boost\%PLATFORM% mkdir package\boost\%PLATFORM%
if not exist package\boost\%PLATFORM%\lib mkdir package\boost\%PLATFORM%\lib
if not exist package\boost\%PLATFORM%\include mkdir package\boost\%PLATFORM%\include
if not exist package\boost\%PLATFORM%\include\json mkdir package\boost\%PLATFORM%\include\json

cd package\boost\%PLATFORM%
    
if %CONFIGURATION% == Release cmake -E copy_directory ..\..\..\build\boost\boost\boost include
if %CONFIGURATION% == Release cmake -E copy_directory ..\..\..\build\boost\boost\stage\%PLATFORM% lib

cd ..\..\..


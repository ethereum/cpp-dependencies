REM installing boost
cmake -E copy_directory package\boost install

REM zipping boost
cd package
if exist boost-1.55.0 cmake -E remove_directory boost-1.55.0
cmake -E rename boost boost-1.55.0
tar -zcvf boost-1.55.0.tar.gz boost-1.55.0
cd ..


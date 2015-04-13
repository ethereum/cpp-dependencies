REM installing jsoncpp
cmake -E copy_directory package\jsoncpp install

REM zipping jsoncpp
cd package
cmake -E rename jsoncpp jsoncpp-1.6.2
tar -zcvf jsoncpp-1.6.2.tar.gz jsoncpp-1.6.2
cd ..


REM installing microhttpd
cmake -E copy_directory package\microhttpd install

REM zipping microhttpd
cd package
cmake -E rename microhttpd microhttpd-0.9.2
tar -zcvf microhttpd-0.9.2.tar.gz microhttpd-0.9.2
cd ..


cmake -Bbuild -H. -DLUA_INCLUDE_DIR=/home/jens/opt/include/ -DLUA_LIBRARY=/home/jens/opt/lib/libluajit.so
lighttpd -f lighttpd.conf -D
convert len_full.jpg -define tiff:tile-geometry=256x256 -compress jpeg 'ptif:test.tif'
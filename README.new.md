cmake -Bbuild -H. -DLUA_INCLUDE_DIR=/home/jens/opt/include/ -DLUA_LIBRARY=/home/jens/opt/lib/libluajit.so
lighttpd -f lighttpd.conf -D
convert len_full.jpg -define tiff:tile-geometry=256x256 -compress jpeg 'ptif:test.tif'

rm -Rf mesonbuild && meson mesonbuild -Dwith-luajit-incl=/home/jens/opt/include -Dwith-luajit-lib=/home/jens/opt/lib -Denable-memcached=true

vips im_vips2tiff bug-full.jpg bug.tif:jpeg:75,tile:512x512,pyramid
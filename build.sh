#!/bin/env sh
cmake -H. -Bbuild -DLUA_LIBRARIES=/home/jens/opt/lib/ -DLUA_INCLUDE_DIR=/home/jens/opt/include/
cmake --build build
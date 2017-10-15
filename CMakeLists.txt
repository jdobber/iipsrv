cmake_minimum_required (VERSION 3.0)
project (iipsrv-fork)


OPTION (LUA_USE_LUAJIT "Use LuaJIT instead of default Lua" ON)
# set path to additional CMake modules
SET(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})

#
#INCLUDE(FindPkgConfig)


#UNSET(Lua_FOUND CACHE)
#UNSET(LUA_INCLUDE_DIR CACHE)
#UNSET(LUA_LIBRARY CACHE)
#FIND_PACKAGE (Lua REQUIRED)

# find lua
#FIND_PACKAGE(Lua REQUIRED)
#MESSAGE(${LUA_VERSION_STRING} " " ${LUA_INCLUDE_DIR} " " ${LUA_LIBRARIES})



#file(GLOB SOURCES src/*.cc)
set (SOURCES src/IIPImage.h
src/IIPImage.cc
src/TPTImage.h
src/TPTImage.cc
src/Compressor.h
src/JPEGCompressor.h
src/JPEGCompressor.cc
src/RawTile.h
src/Timer.h
src/Cache.h
src/TileManager.h
src/TileManager.cc
src/Tokenizer.h
src/IIPResponse.h
src/IIPResponse.cc
src/View.h
src/View.cc
src/Transforms.h
src/Transforms.cc
src/Environment.h
src/URL.h
src/Writer.h
src/Task.h
src/Task.cc
src/OBJ.cc
src/FIF.cc
src/JTL.cc
src/TIL.cc
src/ICC.cc
src/CVT.cc
src/Zoomify.cc
src/DeepZoom.cc
src/SPECTRA.cc
src/PFL.cc
src/IIIF.cc
src/Watermark.h
src/Watermark.cc
src/Memcached.h
src/LUALoader.h
src/LUALoader.cc
src/Main.cc
)


#include_directories( ${LUA_INCLUDE_DIR} )

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++0x")


include(CheckIncludeFile)
include(CheckCXXSymbolExists)
#include(CheckStructMember)
include(CheckTypeSize)
INCLUDE(CheckCXXSourceCompiles)

# time.h
check_include_file(time.h HAVE_TIME_H)
if (HAVE_TIME_H)
    message("Found time.h")
    add_definitions(-DHAVE_TIME_H)
else()
    message("time.h not found")
endif()

# sys/time.h
check_include_file(sys/time.h HAVE_SYS_TIME_H)
if (HAVE_SYS_TIME_H)
    message("Found sys/time.h")
    add_definitions(-DHAVE_SYS_TIME_H)
else()
    message("sys/time.h not found")
endif()


#check_function_exists(gettimeofday HAVE_GETTIMEOFDAY)

# std::isfinite
CHECK_CXX_SOURCE_COMPILES(
    "#include <cmath>\nint main() { return std::isfinite( 0 ); }\n"
    HAVE_ISFINITE )
if (HAVE_ISFINITE)
    message("Found isfinite")
    add_definitions(-DHAVE_ISFINITE)
else()
    message("isfinite not found")
endif()

# require additional packages
find_package(TIFF REQUIRED)
find_package(JPEG REQUIRED)
find_package(FCGI REQUIRED)
find_package(LUA REQUIRED)

# set include dirs
include_directories( ${LUA_INCLUDE_DIR}
    ${TIFF_INCLUDE_DIR}
    ${FCGI_INCLUDE_DIR} )

add_definitions(-DHAVE_SETENV)

add_executable(iipsrv-fork ${SOURCES})
target_link_libraries(iipsrv-fork TIFF::TIFF ${JPEG_LIBRARIES} ${FCGI_LIBRARY} ${LUA_LIBRARY})
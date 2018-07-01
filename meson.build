# https://github.com/ezQuake/ezquake-source/blob/master/meson.build
# https://github.com/GNOME/gdk-pixbuf/blob/master/meson.build
# project
project('iipsrv', 
	'cpp', 
	default_options : ['cpp_std=c++11'])

success = true

cc_args = ['-Wno-deprecated', '-pthread']

cc = meson.get_compiler('cpp')

# sources
#c = run_command('ls_sources.sh')
#sources = c.stdout().strip().split('\n')

sources = [
'src/Cache.h',
'src/Compressor.h',
'src/CVT.cc',
'src/DeepZoom.cc',
#'src/DSOImage.cc',
#'src/DSOImage.h',
'src/Environment.h',
'src/FIF.cc',
'src/ICC.cc',
'src/IIIF.cc',
'src/IIPImage.cc',
'src/IIPImage.h',
'src/IIPResponse.cc',
'src/IIPResponse.h',
'src/JPEGCompressor.cc',
'src/JPEGCompressor.h',
'src/JTL.cc',
#'src/KakaduImage.cc',
#'src/KakaduImage.h',
'src/LUALoader.cc',
'src/LUALoader.h',
'src/Main.cc',
'src/Memcached.h',
'src/OBJ.cc',
#'src/OpenJPEGImage.cc',
#'src/OpenJPEGImage.h',
'src/PFL.cc',
'src/RawTile.h',
'src/SPECTRA.cc',
'src/Task.cc',
'src/Task.h',
'src/TIL.cc',
'src/TileManager.cc',
'src/TileManager.h',
'src/Timer.h',
'src/Tokenizer.h',
'src/TPTImage.cc',
'src/TPTImage.h',
'src/Transforms.cc',
'src/Transforms.h',
'src/URL.h',
'src/View.cc',
'src/View.h',
'src/Watermark.cc',
'src/Watermark.h',
'src/Writer.h',
'src/Zoomify.cc'
]

# dependencies
inc_dirs = []
deps = [	
    cc.find_library('fcgi', required : true),
    cc.find_library('tiff', required : true),
	cc.find_library('jpeg', required : true),
	dependency('threads')
]

# time.h
if cc.has_header('time.h')  
  cc_args += '-DHAVE_TIME_H'
endif

# sys/time.h
if cc.has_header('sys/time.h')  
  cc_args += '-DHAVE_SYS_TIME_H'
endif

# setenv
if cc.has_function('setenv')
  cc_args += '-DHAVE_SETENV'
endif

# std::isfinite
code = '''
#include <cmath>
int main() { return std::isfinite( 0 ); }
'''
if cc.compiles(code, name : 'std::isfinite')	
	cc_args += '-DHAVE_ISFINITE'
else    
	success = false
endif

# openmp
if cc.has_header('omp.h')  
	cc_args += '-fopenmp'
	deps += cc.find_library('gomp', required: true)
endif

# libmemcached
if get_option('enable-memcached')
	if cc.has_header('libmemcached/memcached.h')  	
		cc_args += '-DHAVE_MEMCACHED'
		deps += cc.find_library('memcached', required: true)
	endif
endif

# glog
#if cc.has_header('glog/logging.h')  	
#	deps += cc.find_library('glog', required: true)
#endif

# lua
lua_inc = get_option('with-luajit-incl')
message('Set LUAJIT include dir to: ' + lua_inc)
inc_dirs += lua_inc
lua_lib = get_option('with-luajit-lib')
message('Set LUAJIT libraries dir to: ' + lua_lib)
deps += cc.find_library('luajit', required : true, dirs: lua_lib)

if success
	executable('iipsrv', sources, 
		dependencies: deps, 
		include_directories: 
			include_directories(
				inc_dirs
			),
		cpp_args: cc_args )
endif

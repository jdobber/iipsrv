#ifndef _IIPLUALOADER_H
#define _IIPLUALOADER_H

#include <stdio.h>
#include <string>
#include <lua.hpp>

void print_error(lua_State* state);
void http_remoter_loader(const char* filename, const char *imageId);

#endif
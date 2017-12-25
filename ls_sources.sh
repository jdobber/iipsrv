#!/bin/sh
for i in src/*.h; do
  echo \'$i\',
done
for i in src/*.cc; do
  echo \'$i\',
done
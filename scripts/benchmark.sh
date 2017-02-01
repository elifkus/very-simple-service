#!/bin/bash -ex
PROJECT_DIR=/PRODUCTION/EXPERIMENT/benchmark

cd $WORKSPACE

mkdir -p $PROJECT_DIR
cp -rf scripts $PROJECT_DIR/.
cp -rf data $PROJECT_DIR/.

cd $PROJECT_DIR

export LUA_PATH="/usr/local/lua/5.1/?.lua;./modules/?.lua;/usr/local/lua/5.1/?/?.lua;
                /usr/share/lua/5.1;/usr/share/lua/5.1/?.lua;/usr/share/lua/5.1/?/?.lua;;"

export LUA_CPATH="./?.so;/usr/local/lib/lua/5.1/?.so;/usr/local/lua/5.1/?.so;/usr/share/lua/5.1/?.so;/usr/lib64/lua/5.1/?.so;
                /usr/share/lua/5.1/?.so;;"

/usr/local/bin/wrk -c1 -t1 -d5s -s scripts/requests-with-post-data.lua http://experiment.safkanyazilim.com/
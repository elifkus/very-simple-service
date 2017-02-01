#!/bin/bash -ex
PROJECT_DIR=/PRODUCTION/EXPERIMENT/benchmark

cd $WORKSPACE

mkdir -p $PROJECT_DIR
cp -rf scripts $PROJECT_DIR/.
cp -rf data $PROJECT_DIR/.

cd $PROJECT_DIR

/usr/local/bin/wrk -c1 -t1 -d5s -s scripts/requests-with-post-data.lua http://experiment.safkanyazilim.com/
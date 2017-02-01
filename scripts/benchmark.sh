#!/bin/bash -ex

/usr/local/bin/wrk -c1 -t1 -d5s -s requests-with-post-data.lua http://experiment.safkanyazilim.com/
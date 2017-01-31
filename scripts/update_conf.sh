#!/bin/bash -ex

NGINX_CONF_DIR=/etc/nginx/conf.d

cd $WORKSPACE
cp -rf $WORKSPACE/conf/experiment.conf $NGINX_CONF_DIR/.

chown nginx.nginx $NGINX_CONF_DIR/experiment.conf

mkdir -p /PRODUCTION/EXPERIMENT/log/
chown nginx.nginx /PRODUCTION/EXPERIMENT/log/

/usr/sbin/service nginx reload
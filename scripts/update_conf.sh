NGINX_CONF_DIR=/etc/nginx/conf.d

cd $WORKSPACE
cp -rf $WORKSPACE/conf/experiment.conf $NGINX_CONF/.

/usr/sbin/service nginx reload
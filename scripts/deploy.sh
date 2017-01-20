PROJECT_DIR=/PRODUCTION/EXPERIMENT
WEB_DIR=$PROJECT_DIR/web
GOPATH=$WORKSPACE

mkdir -p $PROJECT_DIR/log
mkdir -p $WEB_DIR/static
mkdir -p $WEB_DIR/savedfiles
mkdir -p $WEB_DIR/gobin

cd $WORKSPACE/src/webservice
#this gets the dependencies but doesn't install them, avoiding permission problems
/usr/local/go/bin/go get -d
#build the packages, -x outputs the compiler command line
/usr/local/go/bin/go build -x
chmod +x webservice
mv webservice $WEB_DIR/gobin

cd $WEB_DIR
cp -rf $WORKSPACE/static/* ./static/.

if [ ! -f $WEB_DIR/savedfiles/index.html ]; then
    ln -s $WEB_DIR/static/index.html $WEB_DIR/savedfiles/index.html
fi

chown -R nginx.nginx static

#use very-simple-service.sh start stop script instead
if [ $(lsof -t -i :8080) ]; then
   kill -9 $(lsof -t -i :8080)
fi

BUILD_ID=dontKillMe nohup $WEB_DIR/gobin/webservice > $PROJECT_DIR/log/webservice.log 2>&1&





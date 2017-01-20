PROJECT_DIR=/PRODUCTION/EXPERIMENT/web
GOPATH=$WORKSPACE

mkdir -p $PROJECT_DIR/static
mkdir -p $PROJECT_DIR/savedfiles
mkdir -p $PROJECT_DIR/gobin

cd $WORKSPACE
cp -rf $WORKSPACE/src/* ./src/.
#this gets the dependencies but doesn't install them, avoiding permission problems
/usr/local/go/bin/go get -d
#build the packages, -x outputs the compiler command line
/usr/local/go/bin/go build -x
mv server $PROJECT_DIR/gobin
chmod +x $PROJECT_DIR/gobin/server

cd $PROJECT_DIR
cp -rf $WORKSPACE/static/* ./static/.
chown -R nginx.nginx static


if [ $(lsof -t -i :8080) ]; then
   kill -9 $(lsof -t -i :8080)
fi

BUILD_ID=dontKillMe nohup ./server &>/dev/null &




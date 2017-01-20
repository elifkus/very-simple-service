PROJECT_DIR=/PRODUCTION/EXPERIMENT/web
GOPATH=$WORKSPACE

mkdir -p $PROJECT_DIR/static

cd $PROJECT_DIR
cp -rf $WORKSPACE/static/* ./static/.

chown nginx.nginx static/*


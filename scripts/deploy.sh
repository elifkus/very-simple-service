PROJECT_DIR=/PRODUCTION/EXPERIMENT/web
GOPATH=$WORKSPACE

mkdir -p $PROJECT_DIR/static
mkdir -p $PROJECT_DIR/savedfiles

cd $PROJECT_DIR
cp -rf $WORKSPACE/static/* ./static/.

chown -R nginx.nginx static


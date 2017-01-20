#!/bin/bash
case $1 in
    start)
        echo "Starting very simple web service."
        /PRODUCTION/EXPERIMENT/web/gobin/webservice &
        ;;
    stop)
        echo "Stopping very simple web service."
        sudo kill $(sudo lsof -t -i:8080)
        ;;
    restart)
        echo "Restarting very simple web service."
        
        if [ $(lsof -t -i :8080) ]; then
		   sudo kill -9 $(lsof -t -i :8080)
		fi
        /PRODUCTION/EXPERIMENT/web/gobin/webservice &
        ;;
    *)
        echo "Very simple web service."
        echo $"Usage $0 {start|stop|restart}"
        exit 1
esac
exit 0
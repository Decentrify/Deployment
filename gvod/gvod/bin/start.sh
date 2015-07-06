#!/bin/bash
echo "$0 $@"
if [ $# -ne 2 ];
    then echo "illegal number of parameters - expected 2: homeDir jarDir"
    exit 1
fi

HOME_DIR=$1
JAR_DIR=$2
JAR_PATH=${JAR_DIR}/gvod_ws.jar
APP_CONF=${HOME_DIR}/etc/gvod.conf
WS_CONF=${HOME_DIR}/etc/gvod_ws.yml
IPV4="-Djava.net.preferIPv4Stack=true"
nohup java $IPV4 -Dconfig.file=$APP_CONF -jar $JAR_PATH server ${WS_CONF} &> ${HOME_DIR}/var/gvod_nohup.out &
eval 'echo $!' > ${HOME_DIR}/gvod.pid

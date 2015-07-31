#!/bin/bash
echo "$0 $@"
if [ $# -ne 2 ];
    then echo "illegal number of parameters - expected 2: homeDir jarDir"
    exit 1
fi

NAME=dy
HOME_DIR=$1
JAR_DIR=$2
WS_JAR=${JAR_DIR}/${NAME}_ws.jar
WS_CONF=${HOME_DIR}/etc/${NAME}_ws.yml
APP_CONF=${HOME_DIR}/etc/application.conf
IPV4="-Djava.net.preferIPv4Stack=true"
nohup java $IPV4 -Dconfig.file=$APP_CONF -jar $WS_JAR &> ${HOME_DIR}/var/${NAME}_nohup.out &
eval 'echo $!' > ${HOME_DIR}/${NAME}.pid



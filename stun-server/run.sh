#!/bin/bash
CONF="-Dlog4j.configuration=file:///home/aaor/Run/stunServer/log4j.properties"
LOG4J="-Dconfig.file=./reference.conf"
IPV4="-Djava.net.preferIPv4Stack=true"
JAR="stun-server.jar"

rm -f nohup.out stun-server.pid stun-server.log*
nohup java $IPV4 $CONF $LOG4J -jar $JAR &> nohup.out &
eval 'echo $!' >> stun-server.pid

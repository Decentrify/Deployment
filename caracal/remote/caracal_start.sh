#!/bin/bash
nohup java -Dlog4j.configuration=file://$PWD/log4j.properties -Dconfig.file=./application.conf -Djava.library.path=./sigar/ -cp ".:./caracaldb-server.jar:./schemas" se.sics.caracaldb.system.Launcher &> nohup.out &
eval 'echo $!' >> caracal.pid

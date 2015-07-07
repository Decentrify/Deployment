#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: deploy|boot|shutdown"
	exit
fi

#USER=lkroll
#HOST_FILE="hosts.conf"
#REMOTE_PATH=/home/lkroll/caracaldb
#LOCAL_PATH=/home/lkroll/caracaldb/remote/*
#BOOTSTRAP="cloud2.sics.se"
source ./config
SERVERS=$(cat "${HOST_FILE}")

howmany() { echo $#; }

function deploy {
	parallel-ssh -h "${HOST_FILE}" -l ${USER} "mkdir -p ${REMOTE_PATH}; rm -rf $REMOTE_PATH/*"
	parallel-scp -h "${HOST_FILE}" -l ${USER} -r $LOCAL_PATH $REMOTE_PATH
	for s in $SERVERS; do
		NUMS=$(howmany $SERVERS)
		ssh ${USER}@${s} "cd $REMOTE_PATH; chmod +x *.sh; echo server.address.hostname = \\\"${s}\\\" >> application.conf; echo bootstrap.address.hostname = \\\"${BOOTSTRAP}\\\" >> application.conf; echo caracal.bootThreshold = ${NUMS} >> application.conf"
		echo "Uploaded to ${USER}@${s}:"
	done
}

function boot {
	parallel-ssh -h "${HOST_FILE}" -l ${USER} "cd $REMOTE_PATH; rm -f simulation.log; rm -f nohup.out; ./caracal_start.sh"
	for s in $SERVERS; do
		echo "Started CaracalDB on ${USER}@${s}:"		
	done

}

function shutdown {
	parallel-ssh -h "${HOST_FILE}" -l ${USER} "cd $REMOTE_PATH; ./killall.sh; rm /tmp/libleveldbjni-64.so"
	for s in $SERVERS; do
		echo "Killed all the things on ${USER}@${s}:"
	done
}

case $1 in
	deploy) deploy
		;;
	boot)	boot
		;;
	shutdown) shutdown
		;;
esac

#caracal.bootThreshold = 6

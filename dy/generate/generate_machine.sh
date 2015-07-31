#!/bin/bash
echo "$0 $@"
if [ $# -ne 10 ];
    then echo "illegal number of parameters - expected 10: 1.homeDir 2.localGenDir 3.remoteGenDir 4.nrNodes 5.configFile 6.loggers 7.selfIp 8.selfStartPort 9.httpStartPort 10.startSeed"
    exit 1
fi

$1/generate_machine_skeleton.sh $2

for ((i=0; i< ${4}; i++))
do
  N_PORT=`expr ${8} + ${i} + ${i}`
  N_HTTP_PORT=`expr ${9} + ${i} + ${i}`
  N_SEED=`expr ${10} + ${i}`

  ${1}/generate_node.sh $1 ${2}/dy/nodes/node${i} ${3}/dy/nodes/node${i} $5 $6 ${N_SEED} $7 ${N_PORT} ${N_HTTP_PORT}   
done

#!/bin/bash
echo "$0 $@"
if [ $# -ne 9 ];
    then echo "illegal number of parameters - expected 9: 1.homeDir 2.localGenDir 3.remoteGenDir 4.configFile 5.loggers 6.selfSeed 7.selfIp 8.selfPort 9.httpPort"
    exit 1
fi

  ${1}/generate_node_skeleton.sh $2
  ${1}/generate_node_yml.sh ${2}/etc $9 $5 ${3}/var
  ${1}/generate_node_config.sh ${2}/etc $4 $6 $7 $8 ${3}/videos ${3}/etc/dy_ws.yml

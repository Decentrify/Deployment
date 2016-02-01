#!/bin/bash
echo "$0 $@"
if [ $# -ne 1 ];
    then echo "illegal number of parameters - expected 1: 1.homeDir"
    exit 1
fi

HOME_DIR=$1
LOGGERS=${HOME_DIR}/dy/loggers
source ${HOME_DIR}/config

rm -rf ${HOME_DIR}/skeleton

for ((i=1; i<= MACHINES; i++))
do
  M_USER=M${i}_USER
  MACHINE=MACHINE${i}
  M_HOME=M${i}_HOME
  M_NODES=M${i}_NODES
  M_PORT=M${i}_PORT
  M_HTTP_PORT=M${i}_HTTP_PORT
  M_SEED=`expr ${SEED} + 10000 \* ${i}`

  mkdir ${HOME_DIR}/skeleton
  ${HOME_DIR}/generate/generate_machine.sh ${HOME_DIR}/generate ${HOME_DIR}/skeleton ${!M_HOME} ${!M_NODES} ${HOME_DIR}/config ${LOGGERS} ${!MACHINE} ${!M_PORT} ${!M_HTTP_PORT} ${M_SEED} 

  cp ${HOME_DIR}/dy/bin/* ${HOME_DIR}/skeleton/dy/bin

  ssh ${!M_USER}@${!MACHINE} "rm -rf ${!M_HOME}/dy/*"
  scp -r ${HOME_DIR}/skeleton/dy ${!M_USER}@${!MACHINE}:${!M_HOME}
  rm -rf ${HOME_DIR}/skeleton
done

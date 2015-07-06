#!/bin/bash
echo "$0 $@"
if [ $# -ne 1 ];
    then echo "illegal number of parameters - expected 1: homeDir"
    exit 1
fi

HOME_DIR=$1
LOGGERS=${HOME_DIR}/gvod/loggers
source ${HOME_DIR}/config
for ((i=1; i<= MACHINES; i++))
do
  M_USER=M${i}_USER
  MACHINE=MACHINE${i}
  M_HOME=M${i}_HOME
  M_NODES=M${i}_NODES
  M_SEED=`expr ${SEED} + 10000 \* ${i}`
  M_GVOD_PORT=M${i}_GVOD_PORT
  M_HTTP_PORT=M${i}_HTTP_PORT

  rm -rf ${HOME_DIR}/skeleton
  mkdir ${HOME_DIR}/skeleton
  ${HOME_DIR}/generate/generate_skeleton.sh ${HOME_DIR}/generate ${HOME_DIR}/skeleton ${!M_HOME} ${!M_NODES} ${M_SEED} ${!M_HTTP_PORT} ${LOGGERS} ${!MACHINE} ${!M_GVOD_PORT} ${CARACAL_IP} ${CARACAL_PORT}

  cp ${HOME_DIR}/gvod/bin/* ${HOME_DIR}/skeleton/gvod/bin

  ssh ${!M_USER}@${!MACHINE} "rm -rf ${!M_HOME}/gvod"
  scp -r ${HOME_DIR}/skeleton/gvod ${!M_USER}@${!MACHINE}:${!M_HOME}/gvod
done

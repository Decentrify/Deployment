#!/bin/bash
echo "$0 $@"
if [ $# -ne 11 ];
    then echo "illegal number of parameters - expected 11: homeDir localGenDir remoteGenDir nodes seed httpPort loggers selfIp selfPort caracalIp caracalPort"
    exit 1
fi

HOME_DIR=$1
LOCAL_GEN_DIR=$2
REMOTE_GEN_DIR=$3
shift 3
${HOME_DIR}/generate_clean.sh ${LOCAL_GEN_DIR}/gvod
mkdir ${LOCAL_GEN_DIR}/gvod
mkdir ${LOCAL_GEN_DIR}/gvod/bin
mkdir ${LOCAL_GEN_DIR}/gvod/lib
mkdir ${LOCAL_GEN_DIR}/gvod/nodes
mkdir ${LOCAL_GEN_DIR}/gvod/videos
${HOME_DIR}/generate_nodes.sh ${HOME_DIR} ${LOCAL_GEN_DIR}/gvod/nodes ${REMOTE_GEN_DIR}/gvod/nodes $@


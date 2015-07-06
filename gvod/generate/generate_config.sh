#!/bin/bash
echo "$0 $@"
if [ $# -ne 9 ];
    then echo "illegal number of parameters - expected 9: genDir seed selfIp selfPort selfId libDir caracalIp caracalPort ymlFile"
    exit 1
fi

GEN_DIR=$1
touch ${GEN_DIR}/gvod.conf
echo "system.seed="$2 >> ${GEN_DIR}/gvod.conf
echo "vod.address.ip=\""$3"\"" >> ${GEN_DIR}/gvod.conf
echo "vod.address.port="$4 >> ${GEN_DIR}/gvod.conf
echo "vod.address.id="$5 >> ${GEN_DIR}/gvod.conf
echo "vod.libDir="$6 >> ${GEN_DIR}/gvod.conf
echo "bootstrap.server.address.ip=\""$3"\"" >> ${GEN_DIR}/gvod.conf
echo "bootstrap.server.address.port="$4 >> ${GEN_DIR}/gvod.conf
echo "bootstrap.server.address.id="$5 >> ${GEN_DIR}/gvod.conf
echo "caracal.address.ip=\""$7"\"" >> ${GEN_DIR}/gvod.conf
echo "caracal.address.port="$8 >> ${GEN_DIR}/gvod.conf
echo "webservice.server=\""${9}"\"" >> ${GEN_DIR}/gvod.conf

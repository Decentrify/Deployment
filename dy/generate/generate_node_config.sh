#!/bin/bash
echo "$0 $@"
if [ $# -ne 7 ];
    then echo "illegal number of parameters - expected 7: 1.localGenDir 2.configFile 3.selfSeed 4.selfIp 5.selfPort 6.vodLibDir 7.webserviceConfig"
    exit 1
fi

source $2
CONFIG_FILE=$1/application.conf
touch ${CONFIG_FILE}

echo "system.seed="$3 >> ${CONFIG_FILE}
echo "system.port="$5 >> ${CONFIG_FILE}
if [ $4 == ${BOOTSTRAP_IP} ] && [ $5 -eq ${BOOTSTRAP_PORT} ]; then
    echo "system.id= -2147483648" >> ${CONFIG_FILE}
fi
echo "system.aggregator.ip=\""${AGGREGATOR_IP}"\"" >> ${CONFIG_FILE}
echo "system.aggregator.port="${AGGREGATOR_PORT} >> ${CONFIG_FILE}
echo "system.aggregator.id="${AGGREGATOR_ID} >> ${CONFIG_FILE}

echo "vod.video.library="$6 >> ${CONFIG_FILE}

echo "caracal.bootstrap.partners=[\"boot\"]" >> ${CONFIG_FILE}
echo "caracal.bootstrap.boot.ip=\""${CARACAL_IP}"\"" >> ${CONFIG_FILE}
echo "caracal.bootstrap.boot.port="${CARACAL_PORT} >> ${CONFIG_FILE}

echo "webservice.server=\""$7"\"" >> ${CONFIG_FILE}


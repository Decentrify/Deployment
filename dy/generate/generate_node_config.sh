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
echo "system.self.ip=\""$4"\"" >> ${CONFIG_FILE}
echo "system.self.port="$5 >> ${CONFIG_FILE}
if [ $4 == ${BOOTSTRAP_IP} ] && [ $5 -eq ${BOOTSTRAP_PORT} ]; then
    echo "system.self.id=0" >> ${CONFIG_FILE}
fi
echo "system.sanityCheckPeriod=30000" >> ${CONFIG_FILE}

echo "vod.address.ip=\""$4"\"" >> ${CONFIG_FILE}
echo "vod.address.port="$5 >> ${CONFIG_FILE}
if [ $4 == ${BOOTSTRAP_IP} ] && [ $5 -eq ${BOOTSTRAP_PORT} ]; then
    echo "vod.address.id=0" >> ${CONFIG_FILE}
fi
echo "vod.libDir="$6 >> ${CONFIG_FILE}

echo "system.aggregator.ip=\""${AGGREGATOR_IP}"\"" >> ${CONFIG_FILE}
echo "system.aggregator.port="${AGGREGATOR_PORT} >> ${CONFIG_FILE}
echo "system.aggregator.id="${AGGREGATOR_ID} >> ${CONFIG_FILE}

echo "caracal.address.ip=\""${CARACAL_IP}"\"" >> ${CONFIG_FILE}
echo "caracal.address.port="${CARACAL_PORT} >> ${CONFIG_FILE}

echo "caracal-client.bootstrap.caracalTimeout = 1000" >> ${CONFIG_FILE}
echo "caracal-client.bootstrap.size = 3" >> ${CONFIG_FILE} 
echo "caracal-client.heartbeat.schemaName = \"gvod.heartbeat\"" >> ${CONFIG_FILE}
echo "caracal-client.heartbeat.period = 2000" >> ${CONFIG_FILE}
echo "caracal-client.heartbeat.size = 10" >> ${CONFIG_FILE}

echo "vod.video.pieceSize=1024" >> ${CONFIG_FILE}
echo "vod.video.piecesPerBlock=1024" >> ${CONFIG_FILE}
echo "vod.video.startPieces=100" >> ${CONFIG_FILE}
echo "vod.video.descriptorUpdate=1000" >> ${CONFIG_FILE}
echo "vod.connection.reqTimeoutPeriod=1000" >> ${CONFIG_FILE}
echo "vod.connection.maxPipeline=100" >> ${CONFIG_FILE}
echo "vod.connection.updatePeriod=1000" >> ${CONFIG_FILE}
echo "vod.hashAlg=\"SHA\"" >> ${CONFIG_FILE}

echo "webservice.server=\""$7"\"" >> ${CONFIG_FILE}

echo "croupier.global.overlayId="${GLOBAL_CROUPIER_ID} >> ${CONFIG_FILE}

echo "stun.client.port1"=${SC_DEFAULT_PORT1} >> ${CONFIG_FILE}
echo "stun.client.port2"=${SC_DEFAULT_PORT2} >> ${CONFIG_FILE}
echo "stun.server.list=[\""${SS1_NAME}"\",\""${SS2_NAME}"\"]" >> ${CONFIG_FILE}
echo "stun.server."${SS1_NAME}".ip=\""${SS1_IP}"\"" >> ${CONFIG_FILE}
echo "stun.server."${SS1_NAME}".port1="${SS_DEFAULT_PORT1} >> ${CONFIG_FILE}
echo "stun.server."${SS1_NAME}".port2="${SS_DEFAULT_PORT2} >> ${CONFIG_FILE}
echo "stun.server."${SS1_NAME}".id="${SS1_ID} >> ${CONFIG_FILE}
echo "stun.server."${SS2_NAME}".ip=\""${SS2_IP}"\"" >> ${CONFIG_FILE}
echo "stun.server."${SS2_NAME}".port1="${SS_DEFAULT_PORT1} >> ${CONFIG_FILE}
echo "stun.server."${SS2_NAME}".port2="${SS_DEFAULT_PORT2} >> ${CONFIG_FILE}
echo "stun.server."${SS2_NAME}".id="${SS2_ID} >> ${CONFIG_FILE}

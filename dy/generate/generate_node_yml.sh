#!/bin/bash
echo "$0 $@"
if [ $# -ne 4 ];
    then echo "illegal number of parameters - expected 4: 1.localGenDir 2.httpPort 3.loggers 4.logDir"
    exit 1
fi

YML_FILE=${1}/dy_ws.yml
touch ${YML_FILE}

echo "http: " > ${YML_FILE}
echo "  port: "${2} >> ${YML_FILE}
echo "  adminPort: "`expr ${2} + 1` >> ${YML_FILE}
echo "logging: " >> ${YML_FILE}
echo "  level: WARN" >> ${YML_FILE}
echo "  loggers: " >> ${YML_FILE}
cat ${3} >> ${YML_FILE}
echo "  console:" >> ${YML_FILE}
echo "    enabled: false" >> ${YML_FILE}
echo "  file: " >> ${YML_FILE}
echo "    enabled: true" >> ${YML_FILE}
echo "    archive: false" >> ${YML_FILE}
echo "    currentLogFilename: ${4}/dy_ws.log" >> ${YML_FILE}

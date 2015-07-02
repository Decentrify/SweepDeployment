#!/bin/bash
echo "$0 $@"
if [ $# -ne 5 ];
    then echo "illegal number of parameters - expected 5: genDir httpPort adminPort loggers logDir"
    exit 1
fi

GEN_DIR=$1
HTTP_PORT=$2
HTTP_ADMIN_PORT=$3
LOGGERS=$4
LOG_DIR=$5
touch ${GEN_DIR}/sweep_ws.yml
echo "http: " > ${GEN_DIR}/sweep_ws.yml
echo "  port: "${HTTP_PORT} >> ${GEN_DIR}/sweep_ws.yml
echo "  adminPort: "${HTTP_ADMIN_PORT} >> ${GEN_DIR}/sweep_ws.yml
echo "logging: " >> ${GEN_DIR}/sweep_ws.yml
echo "  level: WARN" >> ${GEN_DIR}/sweep_ws.yml
echo "  loggers: " >> ${GEN_DIR}/sweep_ws.yml
cat ${LOGGERS} >> ${GEN_DIR}/sweep_ws.yml
echo "  console:" >> ${GEN_DIR}/sweep_ws.yml
echo "    enabled: false" >>${GEN_DIR}/sweep_ws.yml
echo "  file: " >> ${GEN_DIR}/sweep_ws.yml
echo "    enabled: true" >> ${GEN_DIR}/sweep_ws.yml
echo "    archive: false" >> ${GEN_DIR}/sweep_ws.yml
echo "    currentLogFilename: "${LOG_DIR}"/sweep_ws.log" >> ${GEN_DIR}/sweep_ws.yml

#!/bin/bash
echo "$0 $@"
if [ $# -ne 10 ];
    then echo "illegal number of parameters - expected 10: genDir seed selfIp selfPort bootstrapIp bootstrapPort agregatorIp agregatorPort agregatorId ymlFile"
    exit 1
fi

GEN_DIR=$1
touch ${GEN_DIR}/application.conf
echo "system.seed="$2 >> ${GEN_DIR}/application.conf
echo "system.self.ip=\""$3"\"" >> ${GEN_DIR}/application.conf
echo "system.self.port="$4 >> ${GEN_DIR}/application.conf
if [ $3 == $5 ] && [ $4 -eq $6 ]; then
    echo "system.self.id=0" >> ${GEN_DIR}/application.conf
fi
echo "system.bootstrap.nodes=[\"bootNode\"]" >> ${GEN_DIR}/application.conf
echo "system.bootstrap.bootNode.ip=\""$5"\"" >> ${GEN_DIR}/application.conf
echo "system.bootstrap.bootNode.port="$6 >> ${GEN_DIR}/application.conf
echo "system.bootstrap.bootNode.id=0" >> ${GEN_DIR}/application.conf
echo "system.aggregator.ip=\""$7"\"" >> ${GEN_DIR}/application.conf
echo "system.aggregator.port="$8 >> ${GEN_DIR}/application.conf
echo "system.aggregator.id="$9 >> ${GEN_DIR}/application.conf
echo "webservice.server=\""${10}"\"" >> ${GEN_DIR}/application.conf

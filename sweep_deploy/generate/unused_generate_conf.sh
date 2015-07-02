#!/bin/bash
echo "$0 $@"
if [ $# -ne 8 ];
    then echo "illegal number of parameters - expected 8: genDir selfIp selfPort bootstrapIp bootstrapPort agregatorIp agregatorPort agregatorId"
    exit 1
fi

GEN_DIR=$1
touch ${GEN_DIR}/sweep.conf
echo "ip=\""$2"\"" > ${GEN_DIR}/sweep.conf
echo "port="$3"" >> ${GEN_DIR}/sweep.conf
echo "bootstrap_ip=\""$4"\"" >> ${GEN_DIR}/sweep.conf
echo "bootstrap_port="$5"" >> ${GEN_DIR}/sweep.conf
echo "agregator_ip=\""$6"\"" >> ${GEN_DIR}/sweep.conf
echo "agregator_port="$7"" >> ${GEN_DIR}/sweep.conf
echo "agregator_id="$8"" >> ${GEN_DIR}/sweep.conf

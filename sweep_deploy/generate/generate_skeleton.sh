#!/bin/bash
echo "$0 $@"
if [ $# -ne 14 ];
    then echo "illegal number of parameters - expected 14: homeDir localGenDir remoteGenDir nodes seed httpPort loggers selfIp selfStartPort bootstrapIp bootstrapPort agregatorIp agregatorPort agregatorId"
    exit 1
fi

HOME_DIR=$1
LOCAL_GEN_DIR=$2
REMOTE_GEN_DIR=$3
shift 3
${HOME_DIR}/generate_clean.sh ${LOCAL_GEN_DIR}
mkdir ${LOCAL_GEN_DIR}/sweep
mkdir ${LOCAL_GEN_DIR}/sweep/bin
mkdir ${LOCAL_GEN_DIR}/sweep/lib
mkdir ${LOCAL_GEN_DIR}/sweep/nodes
${HOME_DIR}/generate_nodes.sh ${HOME_DIR} ${LOCAL_GEN_DIR}/sweep/nodes ${REMOTE_GEN_DIR}/sweep/nodes $@

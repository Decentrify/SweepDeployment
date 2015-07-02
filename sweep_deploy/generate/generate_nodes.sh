#!/bin/bash
echo "$0 $@"
if [ $# -ne 14 ];
    then echo "illegal number of parameters - expected 14: homeDir localGenDir remoteGenDir nodes seed httpPort loggers selfIp selfStartPort bootstrapIp bootstrapPort agregatorIp agregatorPort agregatorId"
    exit 1
fi

HOME_DIR=$1
LOCAL_GEN_DIR=$2
REMOTE_GEN_DIR=$3
NODES=$4
SEED=$5
HTTP_START_PORT=$6
LOGGERS=$7
SELF_IP=$8
SELF_START_PORT=$9
shift 9
for ((i=0; i< NODES; i++))
do
  NODE_DIR=${LOCAL_GEN_DIR}/node${i}
  mkdir ${NODE_DIR}
  mkdir ${NODE_DIR}/var
  mkdir ${NODE_DIR}/etc
  SELF_PORT=`expr ${SELF_START_PORT} + ${i} + ${i}`
  HTTP_PORT=`expr ${HTTP_START_PORT} + ${i} + ${i}`
  HTTP_ADMIN_PORT=`expr ${HTTP_START_PORT} + ${i} + ${i} + 1`
  ${HOME_DIR}/generate_yml.sh ${NODE_DIR}/etc ${HTTP_PORT} ${HTTP_ADMIN_PORT} ${LOGGERS} ${REMOTE_GEN_DIR}/node${i}/var
  NODE_SEED=`expr ${SEED} + 10 \* ${i}`
  ${HOME_DIR}/generate_config.sh ${NODE_DIR}/etc ${NODE_SEED} ${SELF_IP} ${SELF_PORT} $@ ${REMOTE_GEN_DIR}/node${i}/etc/sweep_ws.yml
done

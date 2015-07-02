#!/bin/bash
echo "$0 $@"
if [ $# -ne 1 ];
    then echo "illegal number of parameters - expected 1: homeDir"
    exit 1
fi

HOME_DIR=$1
LOGGERS=${HOME_DIR}/sweep/loggers
source ${HOME_DIR}/config
for ((i=1; i<= MACHINES; i++))
do
  M_USER=M${i}_USER
  MACHINE=MACHINE${i}
  M_HOME=M${i}_HOME
  M_NODES=M${i}_NODES
  M_SWEEP_PORT=M${i}_SWEEP_PORT
  M_HTTP_PORT=M${i}_HTTP_PORT
  M_SEED=`expr ${SEED} + 10000 \* ${i}`

  rm -rf ${HOME_DIR}/skeleton
  mkdir ${HOME_DIR}/skeleton
  ${HOME_DIR}/generate/generate_skeleton.sh ${HOME_DIR}/generate ${HOME_DIR}/skeleton ${!M_HOME} ${!M_NODES} ${M_SEED} ${!M_HTTP_PORT} ${LOGGERS} ${!MACHINE} ${!M_SWEEP_PORT} ${SWEEP_BOOTSTRAP_IP} ${SWEEP_BOOTSTRAP_PORT} ${AGREGATOR_IP} ${AGREGATOR_PORT} ${AGREGATOR_ID} 

  cp ${HOME_DIR}/sweep/bin/* ${HOME_DIR}/skeleton/sweep/bin

  ssh ${!M_USER}@${!MACHINE} "rm -rf ${!M_HOME}/*"
  scp -r ${HOME_DIR}/skeleton/sweep ${!M_USER}@${!MACHINE}:${!M_HOME}
done

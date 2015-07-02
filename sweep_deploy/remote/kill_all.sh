#!/bin/bash
echo "$0 $@"
if [ $# -ne 1 ];
    then echo "illegal number of parameters - expected 1: homeDir"
    exit 1
fi

HOME_DIR=$1
source ${HOME_DIR}/config
for ((i=1; i<= ${MACHINES}; i++))
do
  M_USER=M${i}_USER
  MACHINE=MACHINE${i}
  M_HOME=M${i}_HOME
  M_NODES=M${i}_NODES
  for ((j=0; j< ${!M_NODES}; j++))
  do
    NODE=node${j}
    echo "ssh ${!M_USER}@${!MACHINE} ${!M_HOME}/sweep/bin/kill.sh ${!M_HOME}/sweep/nodes/${NODE}"
    ssh ${!M_USER}@${!MACHINE} ${!M_HOME}/sweep/bin/kill.sh ${!M_HOME}/sweep/nodes/${NODE}
  done
done

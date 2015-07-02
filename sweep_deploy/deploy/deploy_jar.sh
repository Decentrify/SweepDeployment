#!/bin/bash
echo "$0 $@"
if [ $# -ne 1 ];
    then echo "illegal number of parameters - expected 1: homeDir"
    exit 1
fi

HOME_DIR=$1
source ${HOME_DIR}/config
SRC=${HOME_DIR}/sweep/lib/

for ((i=1; i<= MACHINES; i++))
do
  M_USER=M${i}_USER
  MACHINE=MACHINE${i}
  M_HOME=M${i}_HOME
  DST=${!M_USER}@${!MACHINE}:${!M_HOME}/sweep/lib/
  echo "rsync -rvh $SRC $DST"
  rsync -rvh $SRC $DST
done

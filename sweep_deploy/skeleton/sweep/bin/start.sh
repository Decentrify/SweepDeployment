#!/bin/bash
echo "$0 $@"
if [ $# -ne 2 ];
    then echo "illegal number of parameters - expected 2: homeDir jarDir"
    exit 1
fi

HOME_DIR=$1
JAR_DIR=$2
SWS_JAR=${JAR_DIR}/sweep_ws.jar
SWS_CONF=${HOME_DIR}/etc/sweep_ws.yml
APP_CONF=${HOME_DIR}/etc/application.conf
IPV4="-Djava.net.preferIPv4Stack=true"
nohup java $IPV4 -Dconfig.file=$APP_CONF -jar $SWS_JAR &> ${HOME_DIR}/var/sweep_nohup.out &
eval 'echo $!' > ${HOME_DIR}/sweep.pid



#!/bin/bash
echo "$0 $@"
if [ $# -ne 1 ];
    then echo "illegal number of parameters - expected 1: homeDir"
    exit 1
fi

HOME_DIR=$1
rm ${HOME_DIR}/sweep.pid
rm -rf ${HOME_DIR}/var/*

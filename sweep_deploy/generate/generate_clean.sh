#!/bin/bash
echo "$0 $@"
if [ $# -ne 1 ];
    then echo "illegal number of parameters - expected 1: genDir"
    exit 1
fi

GEN_DIR=$1
rm -rf ${GEN_DIR}/*

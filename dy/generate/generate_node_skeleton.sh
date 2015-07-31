#!/bin/bash
echo "$0 $@"
if [ $# -ne 1 ];
    then echo "illegal number of parameters - expected 1: localGenDir"
    exit 1
fi

mkdir ${1}
mkdir ${1}/etc
mkdir ${1}/var
mkdir ${1}/videos

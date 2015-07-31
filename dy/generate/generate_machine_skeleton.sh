#!/bin/bash
echo "$0 $@"
if [ $# -ne 1 ];
    then echo "illegal number of parameters - expected 1: localGenDir"
    exit 1
fi

mkdir $1/dy
mkdir $1/dy/bin
mkdir $1/dy/lib
mkdir $1/dy/nodes

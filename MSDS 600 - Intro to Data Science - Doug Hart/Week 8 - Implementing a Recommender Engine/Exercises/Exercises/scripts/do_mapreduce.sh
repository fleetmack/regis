#!/bin/bash

STREAMING=/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.3.0-mr1-cdh5.1.0.jar
SCRIPTS=/home/cloudera/Exercises/scripts
HDFS_LOC=/user/data/movielens

if [ "${1}" == "" ] || [ ! -f ${SCRIPTS}/clean_${1}_dat.py ]; then
   echo -e "\nSpecify users, movies, or ratings with ${0}.\nFor example:\n   ${0} users\n"
   exit 1
fi

echo "Removing previous results directory if it exists..."
hadoop fs -rm -r ${HDFS_LOC}/cleaned/${1}
hadoop jar ${STREAMING} \
	-Dmapred.reduce.tasks=0 \
	-input  ${HDFS_LOC}/raw/${1} \
	-output ${HDFS_LOC}/cleaned/${1} \
	-mapper ${SCRIPTS}/clean_${1}_dat.py \
	-file  ${SCRIPTS}/clean_${1}_dat.py

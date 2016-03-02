#!/bin/bash

STREAMING=/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.3.0-mr1-cdh5.1.0.jar
SCRIPTS=/home/cloudera/Exercises/scripts
HDFS_LOC=/user/data/movielens

echo "Removing previous results directory if it exists..."
hadoop fs -rm -r ${HDFS_LOC}/mahout/input
hadoop jar ${STREAMING} \
	-Dmapred.reduce.tasks=0 \
	-input  ${HDFS_LOC}/raw/ratings \
	-output ${HDFS_LOC}/mahout/input \
	-mapper ${SCRIPTS}/clean_mahout_dat.py \
	-file  ${SCRIPTS}/clean_mahout_dat.py

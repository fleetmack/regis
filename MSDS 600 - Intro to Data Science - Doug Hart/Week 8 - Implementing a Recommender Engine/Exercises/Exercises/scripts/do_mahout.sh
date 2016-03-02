#!/bin/bash

SCRIPTS=/home/cloudera/Exercises/scripts
HDFS_LOC=/user/data/movielens

echo "Removing old output and temp directories if they exist..."
hadoop fs -rm -r ${HDFS_LOC}/mahout/output
hadoop fs -rm -r /user/cloudera/temp

mahout recommenditembased \
	--input ${HDFS_LOC}/mahout/input \
	--output ${HDFS_LOC}/mahout/output \
	--usersFile ${HDFS_LOC}/mahout/mahout_users.dat \
	--similarityClassname SIMILARITY_PEARSON_CORRELATION

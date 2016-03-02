#!/bin/bash
SCRIPTS=/home/cloudera/Exercises/scripts
DATADIR=/home/cloudera/Exercises/ml-1m
HDFS_LOC=/user/data/movielens

echo "Removing existing directory if it exists..."
hadoop fs -rm -r ${HDFS_LOC}

hadoop fs -mkdir -p ${HDFS_LOC}/raw
hadoop fs -mkdir ${HDFS_LOC}/raw/users
hadoop fs -mkdir ${HDFS_LOC}/raw/movies
hadoop fs -mkdir ${HDFS_LOC}/raw/ratings

hadoop fs -mkdir ${HDFS_LOC}/cleaned

hadoop fs -mkdir ${HDFS_LOC}/mahout

cd ${DATADIR}

hadoop fs -put users.dat   ${HDFS_LOC}/raw/users
hadoop fs -put movies.dat  ${HDFS_LOC}/raw/movies
hadoop fs -put ratings.dat ${HDFS_LOC}/raw/ratings

cd ${SCRIPTS}

hadoop fs -put mahout_users.dat ${HDFS_LOC}/mahout

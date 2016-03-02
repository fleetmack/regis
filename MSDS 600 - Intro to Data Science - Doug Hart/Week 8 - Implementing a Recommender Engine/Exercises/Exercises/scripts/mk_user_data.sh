# This script needs to be executed to give directory permissions
# on the HDFS path /user/data to the "cloudera" user.
# This only needs to be done one time in a fresh VM.
#
sudo -u hdfs hadoop fs -mkdir /user/data
sudo -u hdfs hadoop fs -chown cloudera /user/data

DROP TABLE ratings;
CREATE TABLE ratings(userid INT, movieid INT, rating INT, tstamp INT)
   ROW FORMAT DELIMITED FIELDS TERMINATED by '\t'
   LINES TERMINATED BY '\n'
   STORED AS TEXTFILE;
LOAD DATA INPATH '/user/data/movielens/cleaned/ratings' INTO TABLE ratings;

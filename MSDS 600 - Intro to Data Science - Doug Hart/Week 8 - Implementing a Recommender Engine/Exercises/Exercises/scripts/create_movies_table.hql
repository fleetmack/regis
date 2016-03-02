DROP TABLE movies;
CREATE TABLE movies(id INT, title STRING, year INT, genres STRING)
   ROW FORMAT DELIMITED FIELDS TERMINATED by '\t'
   STORED AS TEXTFILE;
LOAD DATA INPATH '/user/data/movielens/cleaned/movies' INTO TABLE movies;

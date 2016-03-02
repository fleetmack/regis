DROP TABLE users;
CREATE TABLE users(id INT, gender CHAR(1), age INT, occupation INT, zip CHAR(5))
   ROW FORMAT DELIMITED FIELDS TERMINATED by '\t'
   LINES TERMINATED BY '\n'
   STORED AS TEXTFILE;
LOAD DATA INPATH '/user/data/movielens/cleaned/users' INTO TABLE users;

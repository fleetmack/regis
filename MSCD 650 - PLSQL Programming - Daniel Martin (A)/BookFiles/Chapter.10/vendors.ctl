LOAD DATA 
INFILE 'C:\vendors.csv' 
REPLACE 
INTO TABLE bb_vendor_list 
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
TRAILING NULLCOLS 
(vname, 
 v_cntry, 
 min_lbs INTEGER EXTERNAL, 
 ship_days INTEGER EXTERNAL)

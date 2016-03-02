spool v:\lab7-10.txt
set pagesize 700
set linesize 700
prompt ****** Bryan Mack **********
prompt *** Assignment 1, Part 2 ***
prompt **** Submitted 2/10/2007 *****
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 1
prompt *****************************************************************************
prompt *****************************************************************************
connect classmate/classpass@remote40116.world
prompt ***************************
prompt *****************************************************************************
prompt Create 2 temp tables, follow instructions as this is too long of a question for me to re-type
prompt *****************************************************************************
prompt CREATE GLOBAL TEMPORARY TABLE ch07tempcustorder
prompt (customer_name	varchar2(40),
prompt  total_order_amount  number(5,2));
prompt Drop table if you need to
DROP TABLE ch07tempcustorder;
CREATE GLOBAL TEMPORARY TABLE ch07tempcustorder
(customer_name	varchar2(40),
 total_order_amount  number(5,2));
prompt CREATE GLOBAL TEMPORARY TABLE ch07tempcustordertotals
prompt (customer_order_number	varchar2(10),
prompt  total_state_tax	number(5,2),
prompt  total_shipping_charges number(5,2));
drop table ch07tempcustordertotals;
CREATE GLOBAL TEMPORARY TABLE ch07tempcustordertotals
(customer_order_number	varchar2(10),
 total_state_tax	number(5,2),
 total_shipping_charges number(5,2));
prompt *******************************
prompt Explain how this works for this scenario
prompt *******************************
prompt In my script, I will have the calculations performed and committed.  The temp tables will do the calculations
prompt and output the errors to the spooled file.  When the commit is issued, data in the temporary tables will
prompt be deleted, as that is what global temp tables do (when using the default ON COMMIT DELETE ROWS setting.  
prompt So if the script is to be re-run, the data in the temptables will simply be overwritten.
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 2
prompt *****************************************************************************
prompt *****************************************************************************
prompt Partition the table into 4 even partitions, using employee_id as the partitioning key
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE TABLE CH07EMPLOYEE_RANGE
prompt (EMPLOYEE_ID		NUMBER(10),
prompt JOB_TITLE		VARCHAR2(45),
prompt FIRST_NAME		varchar2(40),
prompt last_name		VARCHAR2(40),
prompt PHONE_NUMBER		varchar2(20))
prompt PARTITION BY RANGE  (employee_id)
prompt 	(PARTITION P1 VALUES LESS THAN (25000)
prompt             TABLESPACE USERS,
prompt          PARTITION P2 VALUES LESS THAN (50000)
prompt             TABLESPACE USERS,
prompt          PARTITION P3 VALUES LESS THAN (75000)
prompt             TABLESPACE USERS,
prompt          PARTITION P4 VALUES LESS THAN (100000)
prompt             TABLESPACE USERS);
DROP TABLE CH07EMPLOYEE_RANGE;
COMMIT;
CREATE TABLE CH07EMPLOYEE_RANGE
(EMPLOYEE_ID		NUMBER(10),
JOB_TITLE		VARCHAR2(45),
FIRST_NAME		varchar2(40),
last_name		VARCHAR2(40),
PHONE_NUMBER		varchar2(20))
PARTITION BY RANGE  (employee_id)
	(PARTITION P1 VALUES LESS THAN (25000)
            TABLESPACE USERS,
         PARTITION P2 VALUES LESS THAN (50000)
            TABLESPACE USERS,
         PARTITION P3 VALUES LESS THAN (75000)
            TABLESPACE USERS,
         PARTITION P4 VALUES LESS THAN (100000)
            TABLESPACE USERS);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 3
prompt *****************************************************************************
prompt *****************************************************************************
prompt Modify Question 2 to rename table, add hash partitiong on job_title, and having 4 subpartitions, in CLASSMATE schema
prompt *****************************************************************************
prompt *****************************************************************************
prompt CONNECT classmate/classpass@remote40116.world
prompt CREATE TABLE CH07EE_RANGEHASH
prompt (EMPLOYEE_ID		NUMBER(10),
prompt JOB_TITLE		VARCHAR2(45),
prompt FIRST_NAME		varchar2(40),
prompt last_name		VARCHAR2(40),
prompt PHONE_NUMBER		varchar2(20))
prompt PARTITION BY RANGE  (employee_id)
prompt SUBPARTITION BY HASH (job_title)
prompt 	SUBPARTITIONS 4 STORE IN
prompt 	(USERS, USERS, USERS, USERS)
prompt 	(PARTITION P1 VALUES LESS THAN (25000)
prompt             TABLESPACE USERS,
prompt          PARTITION P2 VALUES LESS THAN (50000)
prompt             TABLESPACE USERS,
prompt          PARTITION P3 VALUES LESS THAN (75000)
prompt             TABLESPACE USERS,
prompt          PARTITION P4 VALUES LESS THAN (100000)
prompt             TABLESPACE USERS);
prompt CONNECT sys/oracle@remote40116.world AS sysdba
CONNECT classmate/classpass@remote40116.world
DROP TABLE CH07EE_RANGEHASH;
COMMIT;
CREATE TABLE CH07EE_RANGEHASH
(EMPLOYEE_ID		NUMBER(10),
JOB_TITLE		VARCHAR2(45),
FIRST_NAME		varchar2(40),
last_name		VARCHAR2(40),
PHONE_NUMBER		varchar2(20))
PARTITION BY RANGE  (employee_id)
SUBPARTITION BY HASH (job_title)
	SUBPARTITIONS 4 STORE IN
	(USERS, USERS, USERS, USERS)
	(PARTITION P1 VALUES LESS THAN (25000)
            TABLESPACE USERS,
         PARTITION P2 VALUES LESS THAN (50000)
            TABLESPACE USERS,
         PARTITION P3 VALUES LESS THAN (75000)
            TABLESPACE USERS,
         PARTITION P4 VALUES LESS THAN (100000)
            TABLESPACE USERS);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 4
prompt *****************************************************************************
prompt *****************************************************************************
prompt Show, but don't run, the SQL to create CH07GOLD table
prompt *****************************************************************************
prompt *****************************************************************************
prompt I calculated my initial size by taking 20 bytes X 12 updates = 240 bytes/day.   240 * 180 (days in 6 months) = 43200 bytes
prompt I'm pretty sure 43200 bytes converts to 43KB
prompt CREATE TABLE ch07gold
prompt (price		NUMBER(6,3),
prompt  price_datetime	TIMESTAMP,
prompt  time_between   INTERVAL DAY (99) TO SECOND (3))
prompt TABLESPACE USER_DTAB
prompt STORAGE (INITIAL 45k);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 5
prompt *****************************************************************************
prompt *****************************************************************************
prompt Modify the ch07gold CREATE TABLE command appropriately
prompt *****************************************************************************
prompt Note; Calculated my initial size by taking the row length of 50x12 = 600 bytes/day.  600*180 = 108000
prompt I think that converts to 108KB
prompt *****************************************************************************
prompt CREATE TABLE ch07gold_history
prompt (price		NUMBER(6,3),
prompt  price_datetime	TIMESTAMP,
prompt  time_between	INTERVAL DAY (99) TO SECOND (3),
prompt  location	VARCHAR2(25),
prompt  price_in_currency classmate.price_in_currency)
prompt TABLESPACE users
prompt STORAGE (INITIAL 108K);
drop table ch07gold_history;
commit;
CREATE TABLE ch07gold_history
(price		NUMBER(6,3),
 price_datetime	TIMESTAMP,
 time_between	INTERVAL DAY (2) TO SECOND (3),
 location	VARCHAR2(25),
 price_in_currency classmate.price_in_currency)
TABLESPACE users
STORAGE (INITIAL 108K);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 6
prompt *****************************************************************************
prompt Calculated initial size by taking 50 row * 2 rows = 100.  100*180 days = 10800 bytes
prompt Which I believe converts to 10.8KB
prompt *****************************************************************************
prompt CREATE TABLE ch07gold_collection
prompt (price		classmate.price_history,
prompt  price_datetime	TIMESTAMP,
prompt  time_between	INTERVAL DAY (99) TO SECOND (3))
prompt TABLESPACE USER_DTAB
prompt STORAGE (INITIAL 10K PCTFREE 90 PCTUSED 10);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 7
prompt *****************************************************************************
prompt *****************************************************************************
prompt Music Table stuff, create table ch07song 
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE TABLE ch07song
prompt (song_id	NUMBER,
prompt  artist_name	VARCHAR2(30),
prompt  song_title	VARCHAR2(30),
prompt  song_length	NUMBER(4,2),
prompt  song		bfile);
drop table ch07song;
commit;
CREATE TABLE ch07song
(song_id	NUMBER,
 artist_name	VARCHAR2(30),
 song_title	VARCHAR2(30),
 song_length	NUMBER(4,2),
 song		bfile);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Music Table stuff, create table ch07songlist
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE TABLE ch07songlist
prompt (customer_name	VARCHAR2(40),
prompt  street_addr	VARCHAR2(40),
prompt  city		VARCHAR2(30),
prompt  state		VARCHAR2(2),
prompt  zip		VARCHAR2(10),
prompt  cd_name        VARCHAR2(40),
prompt  songlist	classmate.chosensong);
drop table ch07songlist;
commit;
CREATE TABLE ch07songlist
(customer_name	VARCHAR2(40),
 street_addr	VARCHAR2(40),
 city		VARCHAR2(30),
 state		VARCHAR2(2),
 zip		VARCHAR2(10),
 cd_name        VARCHAR2(40),
 songlist	classmate.chosensong);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 8
prompt *****************************************************************************
prompt *****************************************************************************
prompt create temp table based on customer table minus the VARRAY field with all data
prompt NOTE: There is no data in the customer table? This would do it, though, if there were
prompt *****************************************************************************
prompt *****************************************************************************
prompt connect classmate/classpass@remote40116.world
prompt CREATE GLOBAL TEMPORARY TABLE ch07tempcustomer
prompt AS
prompt (SELECT customer_id,
prompt         fullname,
prompt         discount_percent,
prompt         email
prompt    FROM customer);
prompt drop table if exists
drop table ch07tempcustomer;
CREATE GLOBAL TEMPORARY TABLE ch07tempcustomer
AS
(SELECT customer_id,
        fullname,
        discount_percent,
        email
   FROM customer);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 9
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE TABLE ch07permcustomer
prompt AS
prompt (SELECT * FROM customer);
drop table ch07permcustomer;
commit;
CREATE TABLE ch07permcustomer
AS
(SELECT * FROM customer);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 10
prompt *****************************************************************************
prompt *****************************************************************************
prompt create ch07new_addresses object type
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE TABLE ch07new_address
prompt OF customer_address_type 
prompt TABLESPACE user_dtab
prompt STORAGE (INITIAL 10M NEXT 10M);
drop table ch07new_addresses;
commit;
CREATE TABLE ch07new_addresses
OF customer_address_type 
TABLESPACE users
STORAGE (INITIAL 10M NEXT 10M);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 11
prompt *****************************************************************************
prompt *****************************************************************************
prompt Display all objects in the oraclass database
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT object_name
prompt   FROM user_objects;
SELECT object_name
  FROM user_objects;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 12
prompt *****************************************************************************
prompt *****************************************************************************
prompt Display index info by using syntax of jointables.sql
prompt *****************************************************************************
prompt *****************************************************************************
prompt column "Index_Name" format a12
prompt column "Table_Name" format a12
prompt column "Column_Name" format a12
prompt SELECT uic.index_name as "Index_Name",
prompt        uic.table_name as "Table_Name",  
prompt        uic.column_name as "Column_Name"
prompt FROM  user_indexes	ui,
prompt      user_ind_columns	uic
prompt WHERE ui.index_name = uic.index_name
prompt ORDER BY uic.table_name, uic.index_name, uic.column_position;
column "Index_Name" format a12
column "Table_Name" format a12
column "Column_Name" format a12
SELECT uic.index_name as "Index_Name",
       uic.table_name as "Table_Name",  
       uic.column_name as "Column_Name"
FROM  user_indexes	ui,
     user_ind_columns	uic
WHERE ui.index_name = uic.index_name
ORDER BY uic.table_name, uic.index_name, uic.column_position;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 8, Number 1
prompt *****************************************************************************
prompt *****************************************************************************
prompt Create the BEARS table with the stated traits
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE TABLE bears
prompt (
prompt bear_tag	number PRIMARY KEY,
prompt bear_name	varchar2(20),
prompt tagged_date	date,
prompt weight		number(5,2),
prompt height		number(5,2),
prompt birth_date	date,
prompt last_known_location	varchar2(40),
prompt photo		blob,
prompt map		bfile)
prompt ORGANIZATION INDEX
prompt TABLESPACE users
prompt INCLUDING birth_date
prompt OVERFLOW TABLESPACE system;
drop table bears;
commit;
CREATE TABLE bears
(
bear_tag	number PRIMARY KEY,
bear_name	varchar2(20),
tagged_date	date,
weight		number(5,2),
height		number(5,2),
birth_date	date,
last_known_location	varchar2(40),
photo		blob,
map		bfile)
ORGANIZATION INDEX
TABLESPACE users
INCLUDING birth_date
OVERFLOW TABLESPACE system;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 8, Number 2
prompt *****************************************************************************
prompt *****************************************************************************
prompt Modify the LOB part of that previous table
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE TABLE bears2
prompt (
prompt bear_tag	number PRIMARY KEY,
prompt bear_name	varchar2(20),
prompt tagged_date	date,
prompt weight		number(5,2),
prompt height		number(5,2),
prompt birth_date	date,
prompt last_known_location	varchar2(40),
prompt photo		blob,
prompt map		bfile)
prompt ORGANIZATION INDEX
prompt TABLESPACE users
prompt INCLUDING birth_date
prompt OVERFLOW TABLESPACE system
prompt LOB (photo) STORE AS bear_photo_blob
prompt 	(TABLESPACE users
prompt 	     CHUNK 8K
prompt            STORAGE (INITIAL 16K NEXT 16K MAXEXTENTS UNLIMITED)
prompt PCTVERSION 10);
drop table bears2;
commit;
CREATE TABLE bears2
(
bear_tag	number PRIMARY KEY,
bear_name	varchar2(20),
tagged_date	date,
weight		number(5,2),
height		number(5,2),
birth_date	date,
last_known_location	varchar2(40),
photo		blob,
map		bfile)
ORGANIZATION INDEX
TABLESPACE users
INCLUDING birth_date
OVERFLOW TABLESPACE system
LOB (photo) STORE AS bear_photo_blob
	(TABLESPACE users
	     CHUNK 8K
           STORAGE (INITIAL 16K NEXT 16K MAXEXTENTS UNLIMITED)
PCTVERSION 10);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 8, Number 3
prompt *****************************************************************************
prompt *****************************************************************************
prompt Run create_table.sql then query the data dictionary views for several questions
prompt *****************************************************************************
prompt *****************************************************************************
prompt Run Book Script - May produce errors
@v:\bookfiles\83665-6\ch08\create_table.sql
prompt *****************************************************************************
prompt Analyze the table
prompt *****************************************************************************
ANALYZE TABLE ch08surgery VALIDATE STRUCTURE;
ANALYZE TABLE ch08surgery COMPUTE STATISTICS;
prompt *****************************************************************************
prompt How many rows are in the table?
prompt What is the average length of a row in the table?
prompt *****************************************************************************
prompt SELECT num_rows,
prompt        avg_row_len
prompt   FROM user_tables
prompt  WHERE table_name = 'CH08SURGERY';
SELECT num_rows,
       avg_row_len
  FROM user_tables
 WHERE table_name = 'CH08SURGERY';
prompt *****************************************************************************
prompt How many columns have no values in any rows?
prompt *****************************************************************************
prompt SELECT count
prompt   FROM user_unused_col_tabs
prompt  WHERE table_name = 'CH08SURGERY';
SELECT count
  FROM user_unused_col_tabs
 WHERE table_name = 'CH08SURGERY';
prompt that is a 0 as there aren't any that have no values, seen by using this select
SELECT * FROM ch08surgery;
prompt *****************************************************************************
prompt What is the average length of the DOCTOR_NAME column
prompt *****************************************************************************
prompt SELECT avg_col_len
prompt   FROM user_tab_columns
prompt  WHERE table_name = 'CH08SURGERY'
prompt    AND column_name = 'DOCTOR_NAME';
SELECT avg_col_len
  FROM user_tab_columns
 WHERE table_name = 'CH08SURGERY'
   AND column_name = 'DOCTOR_NAME';
prompt *****************************************************************************
prompt How many distinct values in patient_first_name and patient_last_name columns
prompt *****************************************************************************
prompt SELECT num_distinct
prompt   FROM user_tab_columns
prompt  WHERE column_name IN ('PATIENT_FIRST_NAME','PATIENT_LAST_NAME')
prompt   AND table_name = 'CH08SURGERY';
SELECT num_distinct
  FROM user_tab_columns
 WHERE column_name IN ('PATIENT_FIRST_NAME','PATIENT_LAST_NAME')
   AND table_name = 'CH08SURGERY';
prompt *****************************************************************************
prompt Segment name and extent ID of the the table's segment and extent?
prompt *****************************************************************************
prompt COLUMN segment_name HEADING "Segment Name" FORMAT a20
prompt SELECT segment_name,
prompt        extent_id
prompt   FROM user_extents
prompt  WHERE segment_name = 'CH08SURGERY';
COLUMN segment_name HEADING "Segment Name" FORMAT a20
SELECT segment_name,
       extent_id
  FROM user_extents
 WHERE segment_name = 'CH08SURGERY';
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 8, Number 4
prompt *****************************************************************************
prompt *****************************************************************************
prompt Create table ch08iotsurgery, index-organized, etc.
prompt *****************************************************************************
prompt *****************************************************************************
drop table ch08iotsurgery;
commit;
CREATE TABLE CLASSMATE.CH08IOTSURGERY 
(SURGERY_ID NUMBER(10) NOT NULL, 
DOCTOR_NAME VARCHAR2(40) NOT NULL,
PATIENT_FISRT_NAME VARCHAR2(10) NOT NULL, 
PATIENT_LAST_NAME VARCHAR2(30) NOT NULL,
SURGERY_DATE DATE NOT NULL, 
PROCEDURES VARCHAR2(100) NOT NULL, 
CONSTRAINT SURGERY_PK2 PRIMARY KEY(SURGERY_ID))
ORGANIZATION INDEX
TABLESPACE USERS;
INSERT INTO CH08IOTSURGERY VALUES 
(1,'Dr. Sheriton-DeAngelos','Joe','Bailey',
'12-JAN-2004','Knee replacement');
REM
INSERT INTO CH08IOTSURGERY VALUES 
(2,'Dr. Smith','Amy','South',
'14-JAN-2004',0);
INSERT INTO CH08IOTSURGERY VALUES 
(3,'Dr. Angelo','Marge','Summers',
'15-JAN-2004',0);
INSERT INTO CH08IOTSURGERY VALUES 
(4,'Dr. Sheriton-DeAngelos','Thomas','Blankenstone',
'30-MAY-2004',0);
INSERT INTO CH08IOTSURGERY VALUES 
(5,'Dr. Angelo','Leroy','Brown',
'22-OCT-2004',0);
INSERT INTO CH08IOTSURGERY VALUES 
(10,'Dr. Angelo','Marge','Summers',
'12-MAR-2004',0);
INSERT INTO CH08IOTSURGERY VALUES 
(6,'Dr. Smith','Heather','Rain',
'11-FEB-2004','C-section');
INSERT INTO CH08IOTSURGERY VALUES 
(42,'Dr. Angelo','Marge','Summers',
'05-JUL-2004',0);
INSERT INTO CH08IOTSURGERY VALUES 
(7,'Dr. Angelo','Horace','Levins',
'12-APR-2004',0);
INSERT INTO CH08IOTSURGERY VALUES 
(12,'Dr. Sheriton-DeAngelos','Bill','Holmes',
'01-MAR-2004',0);
INSERT INTO CH08IOTSURGERY VALUES 
(33,'Dr. Sheriton-DeAngelos','Martin','Lantern',
'11-SEP-2004',0);
COMMIT;
prompt I cannot figure out where the segments/extents for the IOT table are stored
prompt I have checked everywher and cannot find the segment_name for this table
prompt Tried dba_tables, dba_segments, dba_extents.  Without these, I cannot
prompt compare the two tables.  I would use the following if I knew the IOT's segments
prompt to insert in the IN portion of the WHERE clause ......
prompt SELECT segment_name, extent_id, bytes 
prompt WHERE segment_name IN ('CH08SURGERY','SURGERY_PK', .... ?)
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 8, Number 5
prompt *****************************************************************************
prompt *****************************************************************************
prompt Adjust question 1
prompt *****************************************************************************
prompt bears have long names, like ben rothleisberger
prompt *****************************************************************************
prompt ALTER TABLE bears
prompt MODIFY (bear_name	varchar2(30));
ALTER TABLE bears
MODIFY (bear_name	varchar2(30));
prompt *****************************************************************************
prompt time needs better accuracy
prompt *****************************************************************************
prompt ALTER TABLE bears
prompt MODIFY (tagged_date	timestamp(3));
ALTER TABLE bears
MODIFY (tagged_date	timestamp(3));
prompt *****************************************************************************
prompt bears like to videotape themselves as well as take portraits
prompt *****************************************************************************
prompt ALTER TABLE bears
prompt RENAME COLUMN photo TO photo_film;
ALTER TABLE bears
RENAME COLUMN photo TO photo_film;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 8, Number 6
prompt *****************************************************************************
prompt *****************************************************************************
prompt run ho0806setup.sql, remove data from cho08repair_type, remove data from foreign key in ch08house_repair
prompt Well, this ain't pretty but it works and uses the requirements the book laid out as one 
prompt statement was a DELETE statement and the other is a TRUNCATE :)
prompt *****************************************************************************
prompt *****************************************************************************
prompt Run Book Script - May produce errors
@v:\bookfiles\83665-6\ch08\ho0806setup.sql
ALTER TABLE CH08HOUSE_REPAIR 
DROP CONSTRAINT CH08REPAIR_FK;
ALTER TABLE CH08HOUSE_REPAIR
ADD CONSTRAINT ch08repair_fk FOREIGN KEY(repair_type) REFERENCES ch08repair_type(repair_type)
ON DELETE CASCADE;
DELETE FROM ch08repair_type WHERE repair_type <> 'jeff';
ALTER TABLE CH08HOUSE_REPAIR DISABLE CONSTRAINT CH08REPAIR_FK;
TRUNCATE TABLE ch08repair_type;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 8, Number 7
prompt *****************************************************************************
prompt *****************************************************************************
prompt run my own ho0807setup.sql, what can use DBMS_REDEFINITION and what cannot?
prompt my own ho0807setup.sql (my_ho0807setup.sql) is attached
prompt *****************************************************************************
prompt *****************************************************************************
connect sys/oracle@remote40116.world as sysdba
prompt grant execute_catalog_role to classmate;
grant execute_catalog_role to classmate;
connect classmate/classpass@remote40116.world
@v:\assignment1\part2\my_ho0807setup.sql
prompt It appears that the ones that work are those with primary keys, the others do not
prompt I have included the file i created as my_ho0807setup.sql, hope that's what we were supposed to do
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 8, Number 8
prompt *****************************************************************************
prompt *****************************************************************************
prompt run ho0808setup.sql, then make it so the field child_data is updated with new attribute
prompt *****************************************************************************
prompt *****************************************************************************
prompt Run book file, may have errors for duplicates or other weird stuff
@v:\bookfiles\83665-6\ch08\ho0808setup.sql
prompt See how the child_data field presently looks
SELECT child_data FROM ch08familyties;
prompt Remove and re-add the column to refresh since the data has been updated
prompt I tried to simply modify the type to "validate" but couldn't find the 
prompt correct syntax for this in the book nor through extensive internet searches
prompt and beyond extensive trial and error
ALTER TABLE ch08familyties
DROP COLUMN child_data;
ALTER TABLE ch08familyties
ADD CHILD_DATA CLASSMATE.CH08CHILDINFO;
prompt Now see how it looks
SELECT child_data FROM ch08familyties;
prompt Ok - that didn't work at all, but there's no values anyways in this field so
prompt not sure what there is to update since it showed null values for them all
prompt in my first select statement?  Confusing question since this new "field" within
prompt CH08FHILDINFO has no data in it.
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 8, Number 9
prompt *****************************************************************************
prompt *****************************************************************************
prompt Make changes to ch08familyties table, split names
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER TABLE ch08familyties
prompt ADD (parent1_first_name  VARCHAR2(20),
prompt      parent1_last_name   VARCHAR2(20),
prompt      parent2_first_name  VARCHAR2(20),
prompt      parent2_last_name   VARCHAR2(20));
prompt UPDATE ch08familyties	c1
prompt    SET c1.parent1_first_name =
prompt 	(SELECT SUBSTR(c2.parent_one,1,INSTR(c2.parent_one,' ')-1) 
prompt            FROM ch08familyties	c2
prompt           WHERE c1.parent_one = c2.parent_one);
prompt UPDATE ch08familyties	c1
prompt    SET c1.parent2_first_name =
prompt 	(SELECT SUBSTR(c2.parent_two,1,INSTR(c2.parent_two,' ')-1) 
prompt            FROM ch08familyties	c2
prompt           WHERE c1.parent_two = c2.parent_two);
prompt UPDATE ch08familyties	c1
prompt    SET c1.parent1_last_name =
prompt 	(SELECT SUBSTR(c2.parent_one, INSTR(c2.parent_one,' ')+1, LENGTH(c2.parent_one)-INSTR(c2.parent_one,' '))
prompt 	  FROM ch08familyties	c2
prompt          WHERE c2.parent_one = c1.parent_one);
prompt UPDATE ch08familyties	c1
prompt    SET c1.parent2_last_name =
prompt 	(SELECT SUBSTR(c2.parent_two, INSTR(c2.parent_two,' ')+1, LENGTH(c2.parent_two)-INSTR(c2.parent_two,' '))
prompt 	  FROM ch08familyties	c2
prompt          WHERE c2.parent_two = c1.parent_two);
prompt ALTER TABLE ch08familyties
prompt   SET UNUSED (parent_one, parent_two);
prompt ALTER TABLE ch08familyties
prompt DROP UNUSED COLUMNS;
ALTER TABLE ch08familyties
ADD (parent1_first_name  VARCHAR2(20),
     parent1_last_name   VARCHAR2(20),
     parent2_first_name  VARCHAR2(20),
     parent2_last_name   VARCHAR2(20));
UPDATE ch08familyties	c1
   SET c1.parent1_first_name =
	(SELECT SUBSTR(c2.parent_one,1,INSTR(c2.parent_one,' ')-1) 
           FROM ch08familyties	c2
          WHERE c1.parent_one = c2.parent_one);
UPDATE ch08familyties	c1
   SET c1.parent2_first_name =
	(SELECT SUBSTR(c2.parent_two,1,INSTR(c2.parent_two,' ')-1) 
           FROM ch08familyties	c2
          WHERE c1.parent_two = c2.parent_two);
UPDATE ch08familyties	c1
   SET c1.parent1_last_name =
	(SELECT SUBSTR(c2.parent_one, INSTR(c2.parent_one,' ')+1, LENGTH(c2.parent_one)-INSTR(c2.parent_one,' '))
	  FROM ch08familyties	c2
         WHERE c2.parent_one = c1.parent_one);
UPDATE ch08familyties	c1
   SET c1.parent2_last_name =
	(SELECT SUBSTR(c2.parent_two, INSTR(c2.parent_two,' ')+1, LENGTH(c2.parent_two)-INSTR(c2.parent_two,' '))
	  FROM ch08familyties	c2
         WHERE c2.parent_two = c1.parent_two);
ALTER TABLE ch08familyties
  SET UNUSED (parent_one, parent_two);
ALTER TABLE ch08familyties
DROP UNUSED COLUMNS;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 6
prompt *****************************************************************************
prompt *****************************************************************************
prompt numbers 1 through 5 were "setup" questions
prompt Delte the two invalid rows in ch09world and enable the us_tax_unique constraint
prompt *****************************************************************************
prompt *****************************************************************************
prompt Run book script - might contain errors
@v:\bookfiles\83665-6\ch09\ch09catchup.sql
DELETE FROM ch09world
WHERE person_id IN (100005, 39986);
ALTER TABLE ch09world
MODIFY CONSTRAINT us_tax_unique ENABLE VALIDATE;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 7
prompt *****************************************************************************
prompt *****************************************************************************
prompt add primary key to ch09dog.dog_id
prompt all the extras (non deferrable, immediate, and enabled) are set by default
prompt may produce error as i've run this many times
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER TABLE ch09dog
prompt ADD CONSTRAINT cd_pk PRIMARY KEY (dog_id);
prompt ENABLE;
ALTER TABLE ch09dog
ADD CONSTRAINT cd_pk PRIMARY KEY (dog_id)
ENABLE;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 8
prompt *****************************************************************************
prompt *****************************************************************************
prompt add primary key to ch09dogshow.dogshowid, have system name it, index on user_local tablespace
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER TABLE ch09dogshow
prompt ADD PRIMARY KEY (dogshowid)
prompt USING INDEX TABLESPACE USERS;
prompt ENABLE;
ALTER TABLE ch09dogshow
ADD PRIMARY KEY (dogshowid)
USING INDEX TABLESPACE USERS
ENABLE;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 9
prompt *****************************************************************************
prompt *****************************************************************************
prompt create new table tracking which dogs at which shows.  use foreign keys, etc.
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE TABLE ch09dogattendance
prompt (dog_id		NUMBER,
prompt  dogshowid	NUMBER,
prompt  placement	VARCHAR2(20),
prompt  rank		VARCHAR2(6),
prompt CONSTRAINT pk1 PRIMARY KEY (dog_id, dogshowid),
prompt CONSTRAINT ck1 CHECK (rank IN ('First','Second','Third','Fourth',null)));
drop table ch09dogattendance;
commit;
CREATE TABLE ch09dogattendance
(dog_id		NUMBER,
 dogshowid	NUMBER,
 placement	VARCHAR2(20),
 rank		VARCHAR2(6),
CONSTRAINT pk1 PRIMARY KEY (dog_id, dogshowid),
CONSTRAINT ck1 CHECK (rank IN ('First','Second','Third','Fourth',null)),
CONSTRAINT fk1 FOREIGN KEY (dog_id) REFERENCES ch09dog,
CONSTRAINT fk2 FOREIGN KEY (dogshowid) REFERENCES ch09dogshow);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 10
prompt *****************************************************************************
prompt *****************************************************************************
prompt alter ch09dogshow table accordingly
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER TABLE ch09dogshow
prompt ADD show_date	DATE;
ALTER TABLE ch09dogshow
ADD show_date	DATE;
prompt *****************************************************************************
prompt populate this field with a date
prompt *****************************************************************************
prompt UPDATE ch09dogshow
prompt    SET show_date = sysdate;
UPDATE ch09dogshow
   SET show_date = sysdate;
prompt *****************************************************************************
prompt Add not null constraint
prompt *****************************************************************************
prompt ALTER TABLE ch09dogshow
prompt MODIFY (show_date NOT NULL);
ALTER TABLE ch09dogshow
MODIFY (show_date NOT NULL);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 11
prompt *****************************************************************************
prompt *****************************************************************************
prompt create unique key on ch09dogshow that is deferrable and immediate
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER TABLE ch09dogshow
prompt ADD CONSTRAINT uq1 UNIQUE (show_name, show_date)
prompt INITIALLY IMMEDIATE
prompt DEFERRABLE;
ALTER TABLE ch09dogshow
ADD CONSTRAINT uq1 UNIQUE (show_name, show_date)
INITIALLY IMMEDIATE
DEFERRABLE;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 12
prompt *****************************************************************************
prompt *****************************************************************************
prompt modify constraint so when parent row is deleted, all related orws are deleted
prompt *****************************************************************************
prompt *****************************************************************************
prompt First find the constraints name since I didn't name it
prompt *****************************************************************************
prompt ALTER TABLE ch09dogattendance
prompt DROP CONSTRAINT fk2;
prompt ALTER TABLE ch09dogattendance
prompt ADD CONSTRAINT fk2 FOREIGN KEY(dogshowid) REFERENCES ch09dogshow
prompt ON DELETE CASCADE;
ALTER TABLE ch09dogattendance
DROP CONSTRAINT fk2;
ALTER TABLE ch09dogattendance
ADD CONSTRAINT fk2 FOREIGN KEY(dogshowid) REFERENCES ch09dogshow
ON DELETE CASCADE;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 13
prompt *****************************************************************************
prompt *****************************************************************************
prompt Enforce the stated business rules - minimum 1 year experience, given one unless known
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER TABLE ch09dogowner
prompt ADD CONSTRAINT ck2 CHECK (years_experience >= 1);
prompt ALTER TABLE ch09dogowner
prompt MODIFY years_experience NUMBER DEFAULT 1;
ALTER TABLE ch09dogowner
ADD CONSTRAINT ck2 CHECK (years_experience >= 1);
ALTER TABLE ch09dogowner
MODIFY years_experience NUMBER DEFAULT 1;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 14
prompt *****************************************************************************
prompt *****************************************************************************
prompt add new city and state columns to ch09dogshow with constraint 
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER TABLE ch09dogshow
prompt ADD city	VARCHAR2(30);
prompt ALTER TABLE ch09dogshow
prompt ADD    state	VARCHAR2(2)
prompt CONSTRAINT ck_ds_st CHECK (state IN ('NV','CA','OR','WA','TX',null));
ALTER TABLE ch09dogshow
ADD city	VARCHAR2(30);
ALTER TABLE ch09dogshow
ADD    state	VARCHAR2(2)
CONSTRAINT ck_ds_st CHECK (state IN ('NV','CA','OR','WA','TX',null));
prompt *****************************************************************************
prompt Add sponsor and sponsor status
prompt *****************************************************************************
prompt ALTER TABLE ch09dogshow
prompt ADD sponsor	VARCHAR2(50);
prompt ALTER TABLE ch09dogshow
prompt ADD sponsor_status	VARCHAR2(1) DEFAULT 'T'  NOT NULL ;
ALTER TABLE ch09dogshow
ADD sponsor	VARCHAR2(50);
ALTER TABLE ch09dogshow
ADD sponsor_status	VARCHAR2(1) DEFAULT 'T'  NOT NULL ;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 15
prompt *****************************************************************************
prompt *****************************************************************************
prompt add constraint with us tax id testing
prompt *****************************************************************************
prompt *****************************************************************************
ALTER TABLE ch09world
ADD CONSTRAINT ck_tax1 CHECK ((country='USA') 
     AND (us_tax_id IS NOT NULL))  NOVALIDATE;
ALTER TABLE ch09world
ADD CONSTRAINT ck_tax2 CHECK ((country <> 'USA')
     AND (us_tax_id IS NULL)) NOVALIDATE;
prompt ALTER TABLE ch09world
prompt ADD CONSTRAINT ck_tax1 CHECK ((country='USA') 
prompt      AND (us_tax_id IS NOT NULL))  NOVALIDATE;
prompt ALTER TABLE ch09world
prompt ADD CONSTRAINT ck_tax2 CHECK ((country <> 'USA')
prompt      AND (us_tax_id IS NULL)) NOVALIDATE;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 16
prompt *****************************************************************************
prompt *****************************************************************************
prompt Create BTree index on classified_ad.intake_editor_id
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE INDEX classmate.indx_cls_ad1
prompt     ON classmate.classified_ad
prompt (intake_editor_id DESC)
prompt STORAGE (INITIAL 5K NEXT 2K)
prompt COMPRESS;
prompt attempt to drop index, it might not exist
DROP INDEX classmate.indx_cls_ad1;
CREATE INDEX classmate.indx_cls_ad1
    ON classmate.classified_ad
(intake_editor_id DESC)
STORAGE (INITIAL 5K NEXT 2K)
COMPRESS;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 17
prompt *****************************************************************************
prompt *****************************************************************************
prompt Move the index to a different tablespace and adjust some settings
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER INDEX classmate.indx_cls_ad1 REBUILD
prompt TABLESPACE users
prompt STORAGE (pctincrease 0)
prompt NOCOMPRESS;
ALTER INDEX classmate.indx_cls_ad1 REBUILD
TABLESPACE users
STORAGE (pctincrease 0)
NOCOMPRESS;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 18
prompt *****************************************************************************
prompt *****************************************************************************
prompt create an index to speed up this query (probably a function-based index?)
prompt *****************************************************************************
prompt *****************************************************************************
prompt connect sys/oracle@remote40116.world as sysdba
prompt grant query rewrite to classmate;
prompt connect classmate/classpass@remote40116.world
prompt CREATE INDEX ad_text_id
prompt     ON classmate.classified_ad(instr(ad_text,'BEST BUY'));
connect sys/oracle@remote40116.world as sysdba
grant query rewrite to classmate;
connect classmate/classpass@remote40116.world
prompt drop index, it may not exist
DROP INDEX ad_text_id;
CREATE INDEX ad_text_id
    ON classmate.classified_ad(instr(ad_text,'BEST BUY'));
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 19
prompt *****************************************************************************
prompt *****************************************************************************
prompt add nonunique index to the classmate.customer_address table
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE BITMAP INDEX classmate.btmp_idx1
prompt   ON classmate.customer_address (customer_id, state, city);
prompt drop index, it may not exist (when am i running this?)
DROP INDEX classmate.btmp_idx1;
CREATE BITMAP INDEX classmate.btmp_idx1
  ON classmate.customer_address (customer_id, state, city);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 20
prompt *****************************************************************************
prompt *****************************************************************************
prompt Modify num. 19's index to consolidate index leaf blocks and release unused free space
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER INDEX classmate.btmp_idx1
prompt COALESCE
prompt DEALLOCATE UNUSED;
ALTER INDEX classmate.btmp_idx1
COALESCE
DEALLOCATE UNUSED;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 21
prompt *****************************************************************************
prompt *****************************************************************************
prompt Create bitmap index on the discount_percent field
prompt *****************************************************************************
prompt *****************************************************************************
prompt try to drop index in case it exists
DROP INDEX classmate.custbtmp_indx1;
CREATE BITMAP INDEX classmate.custbtmp_indx1
   ON classmate.customer (discount_percent);
prompt CREATE BITMAP INDEX classmate.custbtmp_indx1
prompt    ON classmate.customer (discount_percent);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 22
prompt *****************************************************************************
prompt *****************************************************************************
prompt Modify the previous index as stated
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER INDEX classmate.custbtmp_indx1 REBUILD
prompt TABLESPACE users
prompt PCTFREE 0
prompt NOLOGGING;
ALTER INDEX classmate.custbtmp_indx1 REBUILD
TABLESPACE users
PCTFREE 0
NOLOGGING;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 23
prompt *****************************************************************************
prompt *****************************************************************************
prompt Modify num 18's index to be a reverse key index, then coalesce the index
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER INDEX ad_text_id REBUILD
prompt REVERSE
prompt COALESCE;
ALTER INDEX ad_text_id REBUILD
REVERSE
COALESCE;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 24
prompt *****************************************************************************
prompt *****************************************************************************
prompt Query the data dictionary that shows certain index information
prompt *****************************************************************************
prompt *****************************************************************************
prompt column index_name HEADING "Index Name" FORMAT a20
prompt column index_type HEADING "Index Type" FORMAT a22
prompt column table_name HEADING "Table Name" FORMAT a20
prompt column column_expression HEADING "Expression" FORMAT a20
prompt column column_name HEADING "Column" FORMAT a20
prompt SELECT ui.index_name,
prompt        ui.index_type,
prompt        ui.table_name,  
prompt        uie.column_expression,	        
prompt        uic.column_name
prompt   FROM user_indexes	ui,
prompt        user_ind_columns	uic,
prompt        user_ind_expressions	uie
prompt  WHERE ui.index_name    = uic.index_name
prompt   AND uie.index_name(+) = uic.index_name;
column index_name HEADING "Index Name" FORMAT a20
column index_type HEADING "Index Type" FORMAT a22
column table_name HEADING "Table Name" FORMAT a20
column column_expression HEADING "Expression" FORMAT a20
column column_name HEADING "Column" FORMAT a20
SELECT ui.index_name,
       ui.index_type,
       ui.table_name,  
       uie.column_expression,	        
       uic.column_name
  FROM user_indexes	ui,
       user_ind_columns	uic,
       user_ind_expressions	uie
 WHERE ui.index_name    = uic.index_name
   AND uie.index_name(+) = uic.index_name;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 9, Number 25
prompt *****************************************************************************
prompt *****************************************************************************
prompt Write a query to generate analyze index commands for every index owned by classmate
prompt *****************************************************************************
prompt *****************************************************************************
prompt select 'ANALYZE INDEX '||index_name||' COMPUTE STATISTICS;'
prompt from user_indexes
prompt where table_owner = 'CLASSMATE';
select 'ANALYZE INDEX '||index_name||' COMPUTE STATISTICS;'
from user_indexes
where table_owner = 'CLASSMATE';
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 10, Number 3 (numbers 1 and 2 are just logging in as classmate)
prompt *****************************************************************************
prompt *****************************************************************************
prompt Create table ch10employee and add the rows in figure 10-2
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE TABLE ch10employee
prompt (employee_id	NUMBER(3) PRIMARY KEY,
prompt  job_title	VARCHAR2(30),
prompt  first_name	VARCHAR2(20),
prompt  last_name	VARCHAR2(20));
prompt COMMIT;
prompt INSERT INTO ch10employee VALUES (1,'Writer','Jerry','Hanson');
prompt INSERT INTO ch10employee VALUES (2,'Chief Editor','Amanda','Gaines');
prompt INSERT INTO ch10employee VALUES (4,'Editor','Orlando','Cortez');
prompt INSERT INTO ch10employee VALUES (12,'Manager','Susan','Cross');
prompt INSERT INTO ch10employee VALUES (20,'Freelance Writer','Joe','Howard');
prompt INSERT INTO ch10employee VALUES (23,'Manager','Edward','Black');
prompt INSERT INTO ch10employee VALUES (33,'Delivery Person','Barney','Frost');
prompt INSERT INTO ch10employee VALUES (35,'Programmer','Bert','Ernest');
prompt INSERT INTO ch10employee VALUES (299,'Delivery Person','Skyler','McDieter');
prompt INSERT INTO ch10employee VALUES (300,'Delivery Person','Amanda','Tolman');
prompt INSERT INTO ch10employee VALUES (301,'Delivery Person','Mark','Perry');
prompt drop table, if it exists
DROP TABLE ch10employee;
commit;
CREATE TABLE ch10employee
(employee_id	NUMBER(3),
 job_title	VARCHAR2(30),
 first_name	VARCHAR2(20),
 last_name	VARCHAR2(20));
COMMIT;
INSERT INTO ch10employee VALUES (1,'Writer','Jerry','Hanson');
INSERT INTO ch10employee VALUES (2,'Chief Editor','Amanda','Gaines');
INSERT INTO ch10employee VALUES (4,'Editor','Orlando','Cortez');
INSERT INTO ch10employee VALUES (12,'Manager','Susan','Cross');
INSERT INTO ch10employee VALUES (20,'Freelance Writer','Joe','Howard');
INSERT INTO ch10employee VALUES (22,'Technician','Terry','Pratchett');
INSERT INTO ch10employee VALUES (23,'Manager','Edward','Black');
INSERT INTO ch10employee VALUES (33,'Delivery Person','Barney','Frost');
INSERT INTO ch10employee VALUES (35,'Programmer','Bert','Ernest');
INSERT INTO ch10employee VALUES (299,'Delivery Person','Skyler','McDieter');
INSERT INTO ch10employee VALUES (300,'Delivery Person','Amanda','Tolman');
INSERT INTO ch10employee VALUES (301,'Delivery Person','Mark','Perry');
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 10, Number 4
prompt *****************************************************************************
prompt *****************************************************************************
prompt Alter table to make employee-id primary key and change the value shown in 10-3
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER TABLE ch10employee
prompt ADD CONSTRAINT ch10e_pk1 PRIMARY KEY (employee_id);
prompt UPDATE ch10employee
prompt    SET job_title = 'Writer'
prompt  WHERE employee_id = 22;
ALTER TABLE ch10employee
ADD CONSTRAINT ch10e_pk1 PRIMARY KEY (employee_id);
UPDATE ch10employee
   SET job_title = 'Writer'
 WHERE employee_id = 22;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 10, Number 5
prompt *****************************************************************************
prompt *****************************************************************************
prompt Write a statement to delte the row change din 10-3
prompt *****************************************************************************
prompt *****************************************************************************
prompt DELETE FROM ch10employee
prompt WHERE employee_id = 22;
prompt COMMIT;
DELETE FROM ch10employee
WHERE employee_id = 22;
COMMIT;

spool off
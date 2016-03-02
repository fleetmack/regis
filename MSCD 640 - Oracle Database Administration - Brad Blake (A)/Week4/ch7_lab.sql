spool U:\regis\MSCD640\Assignment1\Part2\lab7-10.txt
set pagesize 700

prompt ****** Bryan Mack **********
prompt *** Assignment 1, Part 2 ***
prompt **** Submitted DATE (started 2/4/2008) *****
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 1
prompt *****************************************************************************
prompt *****************************************************************************
prompt Create 2 temp tables, follow instructions as this is too long of a question for me to re-type
prompt *****************************************************************************
prompt CREATE GLOBAL TEMPORARY TABLE ch07tempcustorder
prompt (customer_name	varchar2(40),
prompt  total_order_amount  number(5,2));
CREATE GLOBAL TEMPORARY TABLE ch07tempcustorder
(customer_name	varchar2(40),
 total_order_amount  number(5,2));
prompt CREATE GLOBAL TEMPORARY TABLE ch07tempcustordertotals
prompt (customer_order_number	varchar2(10),
prompt  total_state_tax	number(5,2),
prompt  total_shipping_charges number(5,2));
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
prompt CREATE TABLE CH07EMPLOYEE_RANGE
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
CONNECT sys/oracle@remote40116.world AS sysdba
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
CREATE TABLE ch07gold_history
(price		NUMBER(6,3),
 price_datetime	TIMESTAMP,
 time_between	INTERVAL DAY (99) TO SECOND (3),
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
connect classmate/classpass@remote40116.world
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
prompt connect sys/oracle@remote40116.world as sysdba
prompt CREATE TABLE ch07new_addresses
prompt OF customer_address_type 
prompt TABLESPACE user_dtab
prompt STORAGE (INITIAL 10M NEXT 10M);
connect sys/oracle@remote40116.world as sysdba
CREATE TABLE ch07new_addresses
OF customer_address_type 
TABLESPACE user_dtab
STORAGE (INITIAL 10M NEXT 10M);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 7, Number 11
prompt *****************************************************************************
prompt *****************************************************************************
prompt Display all objects in the oraclass database
prompt *****************************************************************************
prompt *****************************************************************************
prompt NOTE: I assume it means find all object_types as otherwise this list will be enormous
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT DISTINCT object_type
prompt   FROM user_objects;
SELECT DISTINCT object_type
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
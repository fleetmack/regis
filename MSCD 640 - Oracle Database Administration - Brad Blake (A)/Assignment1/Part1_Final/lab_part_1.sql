spool U:\regis\MSCD640\Assignment1\Part1\lab1-6.txt
set pagesize 700

prompt ****** Bryan Mack **********
prompt *** Assignment 1, Part 1 ***
prompt **** Submitted 1/25/08 *****
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 1, Number 1
prompt *****************************************************************************
prompt *****************************************************************************
prompt List the path for the Oracle database binary installation files for any version of oracle
prompt *****************************************************************************
prompt *****************************************************************************
prompt c:\oracle\product\10.2.0\db_1\   (for server)
prompt c:\oracle\product\10.2.0\client_1\   (for client)
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 1, Number 2
prompt NOTE: MY FORMATTING DOESN'T HOLD, PLEASE REFER TO MY DIAGRAM IN THE .SQL FILE PLEASE
prompt *****************************************************************************
prompt *****************************************************************************
prompt C:\
prompt 	  \all_apps\
prompt 	  	\oracle\
prompt			\10.2.0\
prompt				\admin\
prompt					\local\
prompt						\bdump\  (holds alread log)
prompt						\cdump\  (holds core dumps)
prompt						\pfile\  (holds the init.ora file)
prompt						\udump\  (holds user trace files)
prompt				\db1\  (holds binary installation files)
prompt				\flash_recovery_area\
prompt				\oradata\  
prompt					\local\  (holds the control files, data files, and redo log files)
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 1, Number 3
prompt *****************************************************************************
prompt *****************************************************************************
prompt ORACLE_HOME= c:\all_apps\oracle\10.2.0\db1
prompt ORACLE_BASE= C:\all_apps\oracle\10.2.0\
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 1, Number 4
prompt *****************************************************************************
prompt *****************************************************************************
prompt   SENDER ------------ACTION----------------------------------->  RECIPIENT
prompt   -----------------------------------------------------------------------
prompt   CLIENT ---connects to Database on Server through TNSNAMES--->  SERVER
prompt   SERVER ---Accepts connection, Logs user on to database ----->  CLIENT
prompt   CLIENT ---Requests list of users from the database --------->  SERVER
prompt   SERVER ---Sends list of users to the user ------------------>  CLIENT
prompt *****************************************************************************
prompt *****************************************************************************
PROMPT Chapter 1, Number 5
prompt *****************************************************************************
prompt *****************************************************************************
prompt I am recommending we upgrade from the Oracle Standard Edition to the Oracle Enterprise Edition for our database software. As
prompt an E-Commerce company, we need to realize that our Standard Edition provides low volume support via Web Access, while the Enterprise
prompt Edition allows for multiple and high-volume web connections (and supports web-based and client/server applications!)
prompt While the Standard Edition allows for multiple users, it isn't designed for high volume usage and is intended for a 
prompt very small number of people.  If we would like users to connect via the web, our base of connecting users will grow
prompt dramatically.  The Enterprise Edition allows for high concurrency of user connections to the database.  Similarly, right now
prompt we are struggling with connectivity to a mere one table (product).  Standard Edition assumes low volume while the EE supports
prompt high volume.  With multiple people connecting both internally and via the web, this high volume data connection will be all
prompt but necessary if we plan on growing.  Please consider allowing for an upgrade to the Oracle Enterprise Edition.
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 2, Number 1
prompt *****************************************************************************
prompt *****************************************************************************
prompt Using the Schema Manager, find the WANT_AD table in the CLASSMATE schema and display
prompt the DDL command that created the table.  Save this as the file named ho0201.sql in
prompt CREATE TABLE "CLASSMATE"."WANT_AD" ("AD_ID" NUMBER(10) NOT NULL, 
prompt    "HEADLINE" VARCHAR2(20 byte) NOT NULL, "AD_TEXT" VARCHAR2(50 
prompt     byte), "AD_OWNER" NUMBER(10) NOT NULL, 
prompt    CONSTRAINT "T_AD_PK" PRIMARY KEY("AD_ID") 
prompt    USING INDEX  
prompt    TABLESPACE "USERS" 
prompt    STORAGE ( INITIAL 64K NEXT 0K MINEXTENTS 1 MAXEXTENTS 
prompt    2147483645 PCTINCREASE 0) PCTFREE 10 INITRANS 2 MAXTRANS 255,
prompt    CONSTRAINT "WANT_AD_OWNER_FK" FOREIGN KEY("AD_OWNER") 
prompt    REFERENCES "CLASSMATE"."CLIENT"("CLIENT_ID"))  
prompt    TABLESPACE "USERS" PCTFREE 10 PCTUSED 0 INITRANS 1 MAXTRANS 
prompt    255 
prompt    STORAGE ( INITIAL 64K NEXT 0K MINEXTENTS 1 MAXEXTENTS 
prompt    2147483645 PCTINCREASE 0) 
prompt    LOGGING 
prompt    MONITORING 
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 2, Number 2, Part a
prompt How many rows are in the [CLIENT] table? (based on Analyze statistics)
prompt *****************************************************************************
prompt *****************************************************************************
prompt The answer is 6
prompt *****************************************************************************
prompt *****************************************************************************
prompt chapter 2, Number 2, Part b
prompt What is the average length of a row?
prompt *****************************************************************************
prompt *****************************************************************************
prompt The answer is 47
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 2, Number 2, Part c
prompt How amny empty blocks are there for the table?
prompt *****************************************************************************
prompt *****************************************************************************
prompt The answer is 0
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 2, Number 3
prompt *****************************************************************************
prompt *****************************************************************************
prompt (answer to 2.3 is attached ho0203.jpg file)
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 2, Number 4, Part a
prompt Is this [CLEINT_VIEW] view valid?  If not, list the Oracle error number(s) and message(s) you find
prompt *****************************************************************************
prompt *****************************************************************************
prompt It is Invalid with this error message: "Line # = 0 Column # = 0 Error Text = ORA-00942: table or view does not exist"
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 2, Number 4, Part b
prompt How can this view be corrected?
prompt This can be corrected by changing the table name from CLIENTS to CLIENT as CLIENTS does not exist.
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 2, Number 4, Part c
prompt Fix the view
prompt *****************************************************************************
prompt *****************************************************************************
prompt ok, I fixed it and it is now valid
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 2, Number 4, Part d
prompt Save the DDL for the corrected view in your solutions direcotry in ho0204.sql
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE OR REPLACE VIEW "CLASSMATE"."CLIENT_VIEW" ("CLIENT_ID",
prompt    "FIRST_NAME","LAST_NAME","NUMBER_OF_ADS") AS 
prompt    SELECT C.CLIENT_ID, 
prompt C.FIRST_NAME, 
prompt C.LAST_NAME, 
prompt COUNT(W.AD_ID) NUMBER_OF_ADS 
prompt FROM CLASSMATE.CLIENT C JOIN CLASSMATE.WANT_AD W 
prompt ON C.CLIENT_ID = W.AD_OWNER 
prompt GROUP BY C.CLIENT_ID, 
prompt C.FIRST_NAME, 
prompt C.LAST_NAME
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 2, Number 5, Part a
prompt Change the password of the CLASSMATE user to STUDENT
prompt *****************************************************************************
prompt *****************************************************************************
prompt I did this by, within the EM, going to Security/Users and double-clicking on CLASSMATE
prompt A box pops up whin which I can enter and confirm my password
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 2, Number 5, part b
prompt Using SQL*Plus, change CLASSMATE password back to CLASSPASS
prompt *****************************************************************************
prompt *****************************************************************************
prompt alter user classmate identified by CLASSPASS;
alter user classmate identified by CLASSPASS;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 3, Question 1
prompt  What options would you use in the DBCA for the described database scenario
prompt *****************************************************************************
prompt *****************************************************************************
prompt step1: I'd select Create a Database for more than obvious reasons
prompt step2: I'd select General Purpose. Although it is mainly for data warehousing (as the data won't change), 
prompt 25 branches will be loading data to the system, so there will be both input and output in this system.
prompt step3: Select a fitting name and sid
prompt step4: Configure for OEM so the Enterprise Manager can be used to maintain
prompt step5: Select Passwords
prompt step6: Sleect ASM as there will be I/O from multiple locations, so ASM can optimize the database for us
prompt step7: Use database file locations from template such that your datafiles' locations will be standard
prompt step8: Check 'Enable Archiving' as we'll want to archive the redo logs in case of a necessary recovery
prompt step9: Check Oracle Data Mining as we'll be doing statistical analysis, and check Enterprise Mgr. Repository
prompt step10: Typical - ASM is on and from my understanding, this will adjust our database to run at optimal
prompt performance instead of our customizing.  Pool/Buffer sizes can be changed later if necessary.
prompt step11: Verify where we want our file locations to be stored at
prompt step12: Generate the scripts so we can run them and manually watch for errors while the database is created
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 3, Question 2
prompt *****************************************************************************
prompt *****************************************************************************
prompt Using the User-Managed File Management method will allow the DBA to alleviate performance issues on this new 3-drive server
prompt through the utilization of mutliple tablespaces and log files on different disks, while customizing the size and name scheme
prompt as well as the file locations of these files.  Currently the CAR_PART and ENGINE_PART table are quite large and frequently
prompt accessed.  When using 10g's user-managed files, we will be able to place those two tables in separate tablespaces stored on
prompt separate disk drives. By keeping these tablespaces on separate disk drives, they will not compete against each other for 
prompt priority in writing to the hard disks.  Likewise, the redologs, along with being multiplexed, can be kept on separate drives 
prompt such that the redo logs for CAR_PART can be multiplexed on the F and G drive and the redo logs for the ENGINE_PART table can 
prompt be multiplexed on the G and H drives. Along with increasing performance, this will provide for excellent backup precautions.
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 3, Question 3
prompt *****************************************************************************
prompt *****************************************************************************
prompt By utiling Oracle 10g's Oracle Managed Files system, along with Automatic Storage Management (AMS), we will be able to
prompt have Oracle optimize our I/O issues for us. ASM optimizes our control files, data files, and redo log files after we select
prompt the file locations, which we can spread out such that our tables CAR_PART and ENGINE_PART reside on tablespaces which are being
prompt written to different disks on our F,G,H configuration so they need not compete for processing power.  Using OMF and ASM will
prompt allow Oracle to monitor size adjustment and the deletion of files when necessary, freeing more time for the DBA's to focus
prompt on other issues.
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 3, Question 4
prompt *****************************************************************************
prompt *****************************************************************************
prompt The errors I found were:
prompt # before the Cache and I/O comment field
prompt No comma should be between parameters (specifically the db_block_size and db_doman parameters)
prompt Note:  Although the most common size for db_block_size is 8192 bites and this one is at 4096, I don't see this as an "error"
prompt so I will leave it alone
prompt The remote_logoin_passwordfile is set to EXCLUSIVE.  This is the default value so this isn't necessary to have in here.  I will remove it.
prompt Spaces in the quotes of the control_file location will be removed
prompt Need .'s in the compatible Oracle version, will add them, and the version in teh control file directory is 10.1.0, not 10.0.1 as the parameter indicates
prompt DATABASE NAME needs a comment # before it
prompt db_name has the db_domain in it, this is unnecessary.  the db_domain will be taken off the db_name parameter
prompt db_name and db_domain will be placed next to each other for clarity
prompt Here is my corrected init.ora file
prompt  #Cache and I/O
prompt  db_block_size=4096
prompt  control_files=("C:\oracle\product\10.1.0\oradata\trial102\control1099.ctl")
prompt  maxinstances=2
prompt  compatible=10.1.0
prompt  #Database Name
prompt  db_name=prod1001
prompt  instance_name=trial02
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 3, question 5
prompt fill in table 3-3 (answers below, both the scripts I used and the "table")
prompt *****************************************************************************
prompt *****************************************************************************
prompt select value, name, isses_modifiable, issys_modifiable 
prompt from v$parameter
prompt where name='db_block_buffers';
select value, name, isses_modifiable, issys_modifiable 
from v$parameter
where name='db_block_buffers';

prompt select value, name, isses_modifiable, issys_modifiable 
prompt from v$parameter
prompt where name='global_names';
select value, name, isses_modifiable, issys_modifiable 
from v$parameter
where name='global_names';

prompt select value, name, isses_modifiable, issys_modifiable 
prompt from v$parameter
prompt where name='open_cursors';
select value, name, isses_modifiable, issys_modifiable 
from v$parameter
where name='open_cursors';

prompt select value, name, isses_modifiable, issys_modifiable 
prompt from v$parameter
prompt where name='fixed_date';
select value, name, isses_modifiable, issys_modifiable 
from v$parameter
where name='fixed_date';

prompt select value, name, isses_modifiable, issys_modifiable 
prompt from v$parameter
prompt where name='java_pool_size';
select value, name, isses_modifiable, issys_modifiable 
from v$parameter
where name='java_pool_size';

prompt blank_trimming   alter system=no    alter session=no  	 default value=false
prompt db_block_buffers alter system=no    alter session=no  	 default value=0
prompt global_names     alter system=yes   alter session=yes     default value=false
prompt open_cursors     alter system=yes   alter session=no      default value=0
prompt fixed_date       alter system=yes   alter session=no      default value=null
prompt java_pool_size   alter system=yes   alter session=no      default value=0
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 3, Question 6
prompt Change the pga_aggregate_target to 25M
prompt *****************************************************************************
prompt *****************************************************************************

prompt alter system set pga_aggregate_target=25M;
alter system set pga_aggregate_target=25M;
prompt show parameter pga_aggregate_target;
show parameter pga_aggregate_target;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 3, Question 7
prompt Change the job_queue_processes parameter to 12
prompt *****************************************************************************
prompt *****************************************************************************
prompt show parameter job_queue_processes;
show parameter job_queue_processes;
prompt alter system set job_queue_processes=12;
alter system set job_queue_processes=12;
prompt show parameter job_queue_processes;
show parameter job_queue_processes;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 3, Question 8
prompt add tablespace indx to database.  make it an oracle managed file.
prompt *****************************************************************************
prompt *****************************************************************************
prompt alter system set db_create_file_dest='C:\MSCD640\DBMS\APP\ADMIN\DA116\ORADATA\DISK1\';
alter system set db_create_file_dest='C:\MSCD640\DBMS\APP\ADMIN\DA116\ORADATA\DISK1\';
prompt create tablespace INDX;
create tablespace INDX;
prompt *****************************************************************************
prompt *****************************************************************************
prompt This query will show my tablespace's datafile's name and location
prompt *****************************************************************************
prompt *****************************************************************************
prompt select file_name from dba_data_files;
select file_name from dba_data_files;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 3, Question 9
prompt Correct the CREATE DATABASE statement
prompt *****************************************************************************
prompt *****************************************************************************
prompt Errors I found:
prompt -unnecessary "FOR UPDATE of paralleldb".  Not sure what that was all about, deleted it
prompt -remove word "TABLESPACE" from the datafile statement
prompt -LOGFILE GROUPS should be ordered with numbers, not lettters
prompt -LOGFILE GROUP path needs no letter drive if it's referencing the ORACLE_BASE environment variable
prompt -renamed the log files to 1 and 2 since I renamed the log groups to 1 and 2
prompt Here is my fixed file

promp CREATE DATABASE ultradb
prompt MAXINSTANCES 25
prompt DATAFILE 'ORACLE_BASE\oradata\system01.dbf'
prompt CHARACTER_SET US7ASCII
prompt LOGFILE GROUP 1 ('ORACLE_BASE\oradata\redo01.log') SIZE 50M,
prompt        GROUP 2 ('ORACLE_BASE\oradata\redo02.log') SIZE 50M;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 3, Question 10
prompt What are the DBCA differences in a Data Warehouse and Transaction Processing model
prompt *****************************************************************************
prompt *****************************************************************************
prompt Difference 1: db_file_multiblock_read_count is 32 on DW and only 8 on TP
prompt This is because the larger the value, the faster Oracle can read tables.  On a data warehouse, no writing (input) is done to the data.
prompt So this amount can be larger, however, on a transaction processing database, it is smaller to allow for more input.
prompt Difference 2: pga_aggregate_target is 32mb on Data warehouse, but only 16MB on Transaction Processing
prompt This is because the program global area (PGA) is used more in a data warehouse than in an OLTP (Online Transaction Processing)
prompt Difference 3: Data Warehouse enables star_transformation
prompt The only database design that uses a star schema is the Data Warehouse, so this is only necessary here

prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 4, Question 1
prompt Display contents of WANT_AD table as it would be seen in the OEM Schema Manager
prompt *****************************************************************************
prompt *****************************************************************************
prompt COLUMN table_name HEADING 'Name' FORMAT a7
prompt SELECT table_name FROM dba_tables WHERE table_name='WANT_AD';
COLUMN table_name HEADING 'Name' FORMAT a7
SELECT table_name FROM dba_tables WHERE table_name='WANT_AD';

prompt COLUMN owner HEADING 'Schema' FORMAT a10
prompt SELECT owner FROM dba_tables WHERE table_name='WANT_AD';
COLUMN owner HEADING 'Schema' FORMAT a10
SELECT owner FROM dba_tables WHERE table_name='WANT_AD';

prompt COLUMN tablespace_name HEADING 'Tablespace' FORMAT a10
prompt SELECT tablespace_name FROM dba_tables WHERE table_name='WANT_AD';
COLUMN tablespace_name HEADING 'Tablespace' FORMAT a10
SELECT tablespace_name FROM dba_tables WHERE table_name='WANT_AD';

prompt SELECT DECODE(iot_name, null,'Standard','IOT') "Table"
prompt FROM  dba_tables WHERE table_name='WANT_AD';
SELECT DECODE(iot_name, null,'Standard','IOT') "Table"
FROM  dba_tables WHERE table_name='WANT_AD';

prompt COLUMN column_name HEADING 'Name' FORMAT a10
prompt COLUMN data_type HEADING 'Datatype' FORMAT a10
prompt COLUMN char_col_decl_length HEADING 'Size'
prompt COLUMN DECODE(data_scale,null,0) HEADING 'Scale' FORMAT a5
prompt prompt COLUMN DECODE(nullable,'N','No','Y','Yes') HEADING 'Nulls?' FORMAT a6
prompt COLUMN data_default HEADING 'Default Value' FORMAT a13
prompt SELECT column_name, data_type, char_col_decl_length,
prompt DECODE(data_scale,null,0),
prompt DECODE(nullable,'N','No','Y','Yes'),
prompt data_default
prompt FROM dba_tab_columns
prompt WHERE table_name='WANT_AD';
COLUMN column_name HEADING 'Name' FORMAT a10
COLUMN data_type HEADING 'Datatype' FORMAT a10
COLUMN char_col_decl_length HEADING 'Size'
COLUMN DECODE(data_scale,null,0) HEADING 'Scale' FORMAT a5
COLUMN DECODE(nullable,'N','No','Y','Yes') HEADING 'Nulls?' FORMAT a6
COLUMN data_default HEADING 'Default Value' FORMAT a13
SELECT column_name, data_type, char_col_decl_length,
DECODE(data_scale,null,0),
DECODE(nullable,'N','No','Y','Yes'),
data_default
FROM dba_tab_columns
WHERE table_name='WANT_AD';

prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 4, Question 2
prompt *****************************************************************************
prompt *****************************************************************************
prompt connect classmate/CLASSPASS@remote40116.world
connect classmate/CLASSPASS@remote40116.world

prompt SET LINESIZE 1000
prompt COLUMN column_name HEADING 'Column|Name' FORMAT a15
prompt COLUMN num_rows HEADING 'Number|of|Rows'
prompt COLUMN table_name HEADING 'Table|Name' FORMAT a10
prompt COLUMN avg_row_len HEADING 'Avg.|Row|Length'
prompt COLUMN avg_col_len HEADING 'Avg.|Column|Length'
prompt COLUMN low_value HEADING 'Low Value'
prompt COLUMN high_value HEADING 'High Value'
prompt BREAK ON num_rows ON avg_row_len
prompt SELECT ut.table_name,
prompt        ut.num_rows,
prompt        ut.avg_row_len,
prompt        utcs.column_name,
prompt        utcs.avg_col_len,
prompt        utcs.low_value,
prompt        utcs.high_value
prompt FROM user_tables	ut,
prompt      user_tab_col_statistics utcs
prompt WHERE ut.table_name = utcs.table_name;
prompt CLEAR COLUMNS;

SET LINESIZE 1000
COLUMN column_name HEADING 'Column|Name' FORMAT a15
COLUMN num_rows HEADING 'Number|of|Rows'
COLUMN table_name HEADING 'Table|Name' FORMAT a10
COLUMN avg_row_len HEADING 'Avg.|Row|Length'
COLUMN avg_col_len HEADING 'Avg.|Column|Length'
COLUMN low_value HEADING 'Low Value'
COLUMN high_value HEADING 'High Value'
BREAK ON num_rows ON avg_row_len
SELECT ut.table_name,
       ut.num_rows,
       ut.avg_row_len,
       utcs.column_name,
       utcs.avg_col_len,
       utcs.low_value,
       utcs.high_value
FROM user_tables	ut,
     user_tab_col_statistics utcs
WHERE ut.table_name = utcs.table_name;
CLEAR COLUMNS;

prompt connect sys/oracle@remote40116.world as sysdba
connect sys/oracle@remote40116.world as sysdba
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 4, Question 3
prompt Part 1 - Display top 10 command which used the most memory (using all components)
prompt *****************************************************************************
prompt *****************************************************************************
SELECT sql_text
  FROM  
    (SELECT sharable_mem + persistent_mem + runtime_mem
       FROM v$sql
       ORDER BY sharable_mem + persistent_mem + runtime_mem DESC)
 WHERE rownum <= 10;

prompt *****************************************************************************
prompt *****************************************************************************
prompt Part 2 - Display top 10 command which used the most CPU time
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT sql_text
prompt   FROM  
prompt     (SELECT *
prompt        FROM v$sql
prompt        ORDER BY cpu_time DESC)
prompt WHERE rownum <= 10;

SELECT sql_text
  FROM  
    (SELECT *
       FROM v$sql
       ORDER BY cpu_time DESC)
 WHERE rownum <= 10;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Part 3 - Display top 10 command which used the most elapsed time
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT sql_text
prompt   FROM  
prompt     (SELECT *
prompt        FROM v$sql
prompt        ORDER BY elapsed_time DESC)
prompt WHERE rownum <= 10;
SELECT sql_text
  FROM  
    (SELECT *
       FROM v$sql
       ORDER BY elapsed_time DESC)
 WHERE rownum <= 10;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Part 4 - Display top 10 command which used the most rows processed
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT sql_text
prompt   FROM  
prompt     (SELECT *
prompt        FROM v$sql
prompt 
prompt ORDER BY rows_processed DESC)
prompt WHERE rownum <= 10;

SELECT sql_text
  FROM  
    (SELECT *
       FROM v$sql
       ORDER BY rows_processed DESC)
 WHERE rownum <= 10;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 4, Question 4
prompt Multiplex the Control file - instructions
prompt *****************************************************************************
prompt *****************************************************************************
prompt Step 1: Shut down database
prompt Step 2: Copy the file through the operating system
prompt Step 3: Place the copied file in the directories:
prompt D:\oracle\product\10.2.0\oradata\TEST01\control1
prompt E:\oracle\product\10.2.0\oradata\TEST01\control1
prompt Rename the control files to control02.ctl and control03.ctl respectively
prompt Step 4: Open init<sid>.ora file for editing
prompt Step 5: Add the two new paths/files created and renamed in Step 3 to the control_files parameter
prompt and save the init<sid>.ora file
prompt Step 6: Start the database in MOUNT mode with the pfile parameter
prompt Step 7: use the CREATE SPFILE ... FROM PFILE command
prompt Step 8: Restart the database
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 4, Question 5
prompt *****************************************************************************
prompt *****************************************************************************
prompt The command is as follows:
prompt ALTER DATABASE BACKUP CONTROLFILE TO TRACE;
prompt This will put the control file creation script in the bdump alert log file
prompt Find this dump file and save this statement for future use.
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 4, Question 6
prompt *****************************************************************************
prompt *****************************************************************************
prompt I would recommend dba_tables, dba_tab_cols, dba_tab_col_statistics
prompt These contain all the data dictionary of the tables (dba_tables), the makeup of the columns (dba_tab_cols),
prompt and breakdowns of statistics in each of these columns. dba_tab_col_statistics can show columns which
prompt have no values in them.

prompt *****************************************************************************
prompt *****************************************************************************
prompt Chater 4, Question 7, Part A
prompt Query to find the redo log group numbers and how many members each group has
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT group#, members FROM v$log;
SELECT group#, members FROM v$log;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 4, Question 7, Part B
prompt What directory(ies) hold the redo log group members
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT member FROM v$logfile;
SELECT member FROM v$logfile;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 4, Question 7, Part C
prompt Are there archived redo log files?  Where are they?  How many are there?
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT * FROM v$archived_log;
SELECT * FROM v$archived_log;

prompt There are no archived logs.

prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 4, Question 8
prompt *****************************************************************************
prompt *****************************************************************************
prompt  SHUTDOWN
prompt --now manually move the files using copy/paste such that drive C contains one file of groups 1, 2, and 3
prompt --drive D contains one file of groups 1, 2, and 3, and drive E contains the third file of group 3.
prompt Now we will rename the current files
prompt STARTUP MOUNT
prompt ALTER DATABASE RENAME FILE 'c:\oracle\product\10.2.0\oradata\TEST01\file1a' to 'C:\oracle\product\10.2.0\oradata\TEST01\redo01.log';
prompt ALTER DATABASE RENAME FILE 'c:\oracle\product\10.2.0\oradata\TEST01\file2a' to 'C:\oracle\product\10.2.0\oradata\TEST01\redo02C.log';
prompt ALTER DATABASE RENAME FILE 'C:\oracle\product\10.2.0\oradata\TEST01\file3a' to 'C:\oracle\product\10.2.0\oradata\TEST01\redo03C.log';
prompt ALTER DATABASE RENAME FILE 'D:\oracle\product\10.2.0\oradata\TEST01\file1b' to 'C:\oracle\product\10.2.0\oradata\TEST01\redo01.log';
prompt ALTER DATABASE RENAME FILE 'D:\oracle\product\10.2.0\oradata\TEST01\file2b' to 'C:\oracle\product\10.2.0\oradata\TEST01\redo02d.log';
prompt ALTER DATABASE RENAME FILE 'D:\oracle\product\10.2.0\oradata\TEST01\file3b' to 'C:\oracle\product\10.2.0\oradata\TEST01\redo03d.log';
prompt ALTER DATABASE RENAME FILE 'D:\oracle\product\10.2.0\oradata\TEST01\file3c' to 'C:\oracle\product\10.2.0\oradata\TEST01\redo03e.log';
prompt ALTER DATABASE OPEN;
prompt Now we will add the files which need to be added to add a third file to groups one and two
prompt ALTER DATABASE ADD LOGFILE MEMBER 'E:\oracle\product\10.2.0\oradata\TEST01\redo01.log' TO GROUP 1;
prompt ALTER DATABASE ADD LOGFILE MEMBER 'E:\oracle\product\10.2.0\oradata\TEST01\redo02e.log' TO GROUP 2;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 1
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE TABLESPACE TEST  
prompt	DATAFILE 'c:\MSCD640\DBMS\APP\ADMIN\DA116\ORADATA\DISK1\test01.dbf' SIZE 5M
prompt	EXTENT MANAGEMENT AUTOALLOCATE SEGMENT SPACE MANAGEMENT AUTO; 
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 2, part 1 - Create Tablespace
prompt *****************************************************************************
prompt *****************************************************************************
CREATE TABLESPACE HANDS_62
DATAFILE 'C:\TEMP\hands_62_mack.dbf' SIZE 10M;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 2, Part 2 - Add datafile to tablespace
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER TABLESPACE HANDS_62
prompt ADD DATAFILE 'C:\TEMP\hands_62_mack_2.dbf' SIZE 5M;
ALTER TABLESPACE HANDS_62
ADD DATAFILE 'C:\TEMP\hands_62_mack_2.dbf' SIZE 5M;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 2, Part 3 - Query data dictionary to display total available space in tablespace
prompt *****************************************************************************
prompt *****************************************************************************
prompt select tablespace_name, (sum(bytes)/(1024*1024)) "Free Space (MB)"
prompt from dba_free_space
prompt where tablespace_name='HANDS_62'
prompt group by tablespace_name;
select tablespace_name, (sum(bytes)/(1024*1024)) "Free Space (MB)"
from dba_free_space
where tablespace_name='HANDS_62'
group by tablespace_name;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 2, Part 4 - Make tablespace read only and take offline
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER TABLESPACE HANDS_62 READ ONLY;
prompt ALTER TABLESPACE HANDS_62 OFFLINE;
ALTER TABLESPACE HANDS_62 READ ONLY;
ALTER TABLESPACE HANDS_62 OFFLINE;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 2, Part 5 - Drop tablespace
prompt *****************************************************************************
prompt *****************************************************************************
prompt DROP TABLESPACE HANDS_62
prompt INCLUDING CONTENTS
prompt AND DATAFILES;
DROP TABLESPACE HANDS_62
INCLUDING CONTENTS
AND DATAFILES;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 3, Part 1 - Create tablespace using OMF
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE TABLESPACE HANDS62;
CREATE TABLESPACE HANDS62;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 3, Part 2 - Add datafile to tablespace
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER TABLESPACE HANDS_62
prompt ADD DATAFILE 'C:\TEMP\hands_62_mack_3.dbf' SIZE 5M;
ALTER TABLESPACE HANDS_62
ADD DATAFILE 'C:\TEMP\hands_62_mack_3.dbf' SIZE 5M;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 3, Part 3 - Query data dictionary to display total available space in tablespace
prompt *****************************************************************************
prompt *****************************************************************************
prompt select tablespace_name, (sum(bytes)/(1024*1024)) "Free Space (MB)"
prompt from dba_free_space
prompt where tablespace_name='HANDS_62'
prompt group by tablespace_name;
select tablespace_name, (sum(bytes)/(1024*1024)) "Free Space (MB)"
from dba_free_space
where tablespace_name='HANDS_62'
group by tablespace_name;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 3, Part 4 - Make tablespace read only and take offline
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER TABLESPACE HANDS_62 READ ONLY;
ALTER TABLESPACE HANDS_62 READ ONLY;
prompt ALTER TABLESPACE HANDS_62 OFFLINE;
ALTER TABLESPACE HANDS_62 OFFLINE;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 3, Part 5 - Drop tablespace
prompt *****************************************************************************
prompt *****************************************************************************
prompt DROP TABLESPACE HANDS_62;
DROP TABLESPACE HANDS_62;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 4
prompt *****************************************************************************
prompt *****************************************************************************
prompt It is difficult for a DBA to manage a tablespace when the storage within tables are constantly being increased.  By simply taking
prompt one field from a value of char(50) to char(100), the size of that field has doubled.  When the size of fields increase,
prompt the table can fill its MAXEXTENTS limit quickly, as when that is reached the table (or any other schema object) cannot
prompt continue to grow.  Likewise, when a tablespace reaches its capacity, productivity comes to a halt until the database can be 
prompt increased in size.  I would recommend that the tablespace be modified with the parameters of MAXEXTENTS UNLIMITED and 
prompt AUTOEXTEND ON such that the tables can grow to an unlimited extent size, and so that the tablespace can increase in size
prompt without bringing the database's productivity to a halt.

prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 5
prompt *****************************************************************************
prompt *****************************************************************************
prompt An extent is the smallest group of data that can be entered or retrieved from a database's memory.  A table, 
prompt (which is the largest out of the extent, segment, and table) is a schema object which has one segment per partition 
prompt it is stored on.  If a table is only stored on one partition, it only has one segment. A
prompt segment is made up of as many extents as it takes in order to fulfull the table's storage needs.
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 6, Part 1
prompt Add identical data file
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER TABLESPACE CUSTOMERSERVICES
prompt ADD DATAFILE 'C:\temp\cust_serv02.dbf' SIZE50M
prompt AUTOEXTEND OFF;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 6, Part 2
prompt make first data file 25M
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER DATABASE DATAFILE 'c:\temp_cust_serv01.dbf'
prompt RESIZE 25M;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 6, Part 3
prompt *****************************************************************************
prompt *****************************************************************************
prompt Make the second datafile expandable forever
prompt ALTER DATABASE DATAFILE 'C:\temp\cust_serv02.dbf' AUTOEXTEND ON;
prompt ALTER DATABASE DATAFILE 'C:\temp\cust_serv02.dbf' MAXEXTENTS UNLIMITED;

prompt I think a benefit of having an unlimited datafile would be production.  When a datafile is filled, the time doesn't
prompt need to be taken to enlarge the datafile as autoextend takes care of this for you.  I would think a con of this would be
prompt that the tablespace could grow to fill a hard disk and cause a database crash.
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 7
prompt *****************************************************************************
prompt *****************************************************************************
prompt CREATE TEMPORARY TABLESPACE MACK
prompt TEMPFILE SIZE 20M;
prompt set linesize 750
prompt column "Tablespace Name" FORMAT a15
prompt SELECT tb.name "Tablespace Name", 
prompt        tp.bytes/(1024*1024) "Size (MB)",
prompt        tp.name "Datafile Name"
prompt   FROM V$TABLESPACE	tb,
prompt        V$TEMPFILE	tp
prompt  WHERE tb.ts#	 = tp.ts#
prompt    AND tb.name = 'MACK';
prompt CLEAR COLUMNS;
CREATE TEMPORARY TABLESPACE MACK
TEMPFILE SIZE 20M;


set linesize 750
column "Tablespace Name" FORMAT a15
SELECT tb.name "Tablespace Name", 
       tp.bytes/(1024*1024) "Size (MB)",
       tp.name "Datafile Name"
  FROM V$TABLESPACE	tb,
       V$TEMPFILE	tp
 WHERE tb.ts#	 = tp.ts#
   AND tb.name = 'MACK';

CLEAR COLUMNS;

prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 8
prompt Query to find your current temporary tablespace when logged on as sys
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT tablespace_name
prompt FROM dba_tablespaces
prompt WHERE contents='TEMPORARY'
prompt AND status='ONLINE';
SELECT tablespace_name
FROM dba_tablespaces
WHERE contents='TEMPORARY'
AND status='ONLINE';
prompt *****************************************************************************
prompt *****************************************************************************
prompt Query to show current space used and free space in all temporary tablespaces
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT (SUM(bytes_used)/(1024*1024)) "Used Space (MB)",
prompt        (SUM(bytes_free)/(1024*1024)) "Free Space (MB)"
prompt   FROM v$temp_space_header;
SELECT (SUM(bytes_used)/(1024*1024)) "Used Space (MB)",
       (SUM(bytes_free)/(1024*1024)) "Free Space (MB)"
  FROM v$temp_space_header;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 5, Question 9
prompt display the undo-related initialization parameters
prompt *****************************************************************************
prompt *****************************************************************************
prompt SHOW PARAMETERS UNDO
SHOW PARAMETERS UNDO
prompt *****************************************************************************
prompt *****************************************************************************
prompt Change the retention time to 10 minutes
prompt *****************************************************************************
prompt *****************************************************************************
prompt ALTER SYSTEM SET UNDO_RETENTION=600;
ALTER SYSTEM SET UNDO_RETENTION=600;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Write a Query using DBA_UNDO_EXTENTS to summarize the used blocks in the undo tablespace
prompt *****************************************************************************
prompt *****************************************************************************
prompt select status, sum(blocks)
prompt from dba_undo_extents
prompt group by status;
select status, sum(blocks)
from dba_undo_extents
group by status;





prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 6, Question 1, Part a
prompt Find 2 performance views of redo log files
prompt *****************************************************************************
prompt *****************************************************************************
prompt They are v$log and v$logfile
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 6, Question 1, Part b
prompt QUery to display redo log groups excluding member details
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT * FROM v$log;
SELECT * FROM v$log;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 6, Question 1, Part c
prompt Query to display redo log members as well as groups
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT * FROM v$logfile;
SELECT * FROM v$logfile;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 6, Question 1, Part d
prompt Query to link all redo log members with their respective groups
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT group#, member FROM v$logfile;
SELECT group#, member FROM v$logfile;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 6, Question 2
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT object_name, object_type
prompt FROM dba_objects
prompt WHERE object_type IN ('TABLE','VIEW')
prompt  AND OWNER='CLASSMATE'
prompt ORDER BY object_name;
SELECT object_name, object_type
FROM dba_objects
WHERE object_type IN ('TABLE','VIEW')
  AND OWNER='CLASSMATE'
ORDER BY object_name;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 6, Question 3, Part a
prompt Find CLASSMATE user, CLIENT table, CLIENT_ID values between 1000 and 2000
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT client_id
prompt  FROM classmate.client
prompt WHERE client_id BETWEEN 1000 and 2000;
SELECT client_id
  FROM classmate.client
 WHERE client_id BETWEEN 1000 and 2000;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 6, Question 3, Part b
prompt Find all CLASSMATE user, CLIENT table rows, where no 1-800 numbers are included
prompt NOTE: All values in the table are 800-, not 1-800- like the book suggests
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT *
prompt   FROM classmate.client
prompt  WHERE SUBSTR(contact_phone,1,3) <> 800;
SELECT *
  FROM classmate.client
 WHERE SUBSTR(contact_phone,1,3) <> 800;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 6, Question 3, Part C
prompt Find all CLASSMATE.Client rows minus the last names Brook, Storm, and Moore
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT *
prompt   FROM classmate.client
prompt  WHERE Last_Name NOT IN ('Brook','Storm','Moore');
SELECT *
  FROM classmate.client
 WHERE Last_Name NOT IN ('Brook','Storm','Moore');
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 6, Question 3, Part D
prompt Find all datafiles that exist as tablespaces using V$ performance views.
prompt Use a single subquery and a where clause with only an expression on the left of the where clause
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT name
prompt   FROM v$datafile	dt
prompt  WHERE dt.ts# IN
prompt 	(SELECT tb.ts#
prompt            FROM v$tablespace	tb
prompt           WHERE tb.ts# = dt.ts#);
SELECT name
  FROM v$datafile	dt
 WHERE dt.ts# IN
	(SELECT tb.ts#
           FROM v$tablespace	tb
          WHERE tb.ts# = dt.ts#);
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 6, Question 4
prompt Find First 10 rows in teh ALL_OBJECTS view
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT * FROM all_objects
prompt WHERE rownum <= 10;
SELECT * FROM all_objects
WHERE rownum <= 10;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 6, Question 5
prompt Same as Number 4 but sort by object_name within the owner column
prompt *****************************************************************************
prompt *****************************************************************************
prompt SELECT * FROM all_objects
prompt WHERE rownum <= 10
prompt ORDER BY owner, object_name;
SELECT * FROM all_objects
WHERE rownum <= 10
ORDER BY owner, object_name;

spool off
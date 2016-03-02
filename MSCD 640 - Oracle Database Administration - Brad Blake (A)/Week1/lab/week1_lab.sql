prompt Chapter 1, Number 1
prompt List the path for the Oracle database binary installation files for any version of oracle
prompt c:\oracle\product\10.2.0\db_1\   (for server)
prompt c:\oracle\product\10.2.0\client_1\   (for client)

prompt Chapter 1, Number 2
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


prompt Chapter 1, Number 3
prompt ORACLE_HOME= c:\all_apps\oracle\10.2.0\db1
prompt ORACLE_BASE= C:\all_apps\oracle\10.2.0\

prompt Chapter 1, Number 4
prompt   SENDER ------------ACTION----------------------------------->  RECIPIENT
prompt   -----------------------------------------------------------------------
prompt   CLIENT ---connects to Database on Server through TNSNAMES--->  SERVER
prompt   SERVER ---Accepts connection, Logs user on to database ----->  CLIENT
prompt   CLIENT ---Requests list of users from the database --------->  SERVER
prompt   SERVER ---Sends list of users to the user ------------------>  CLIENT

Chapter 1, Number 5

prompt I am recommending we upgrade from the Oracle Standard Edition to the Oracle Enterprise Edition for our database software. As
prompt an E-Commerce company, we need to realize that our Standard Edition provides low volume support via Web Access, while the Enterprise
prompt Edition allows for multiple and high-volume web connections (and supports web-based and client/server applications!)
prompt While the Standard Edition allows for multiple users, it isn't designed for high volume usage and is intended for a 
prompt very small number of people.  If we would like users to connect via the web, our base of connecting users will grow
prompt dramatically.  The Enterprise Edition allows for high concurrency of user connections to the database.  Similarly, right now
prompt we are struggling with connectivity to a mere one table (product).  Standard Edition assumes low volume while the EE supports
prompt high volume.  With multiple people connecting both internally and via the web, this high volume data connection will be all
prompt but necessary if we plan on growing.  Please consider allowing for an upgrade to the Oracle Enterprise Edition.


prompt Chapter 2, Number 1
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

prompt Chapter 2, Number 2, Part a
prompt How many rows are in the [CLIENT] table? (based on Analyze statistics)
prompt The answer is 6

prompt chapter 2, Number 2, Part b
prompt What is the average length of a row?
prompt The answer is 47

prompt Chapter 2, Number 2, Part c
prompt How amny empty blocks are there for the table?
prompt The answer is 0

prompt Chapter 2, Number 3
prompt (answer to 2.3 is attached ho0203.html file)


prompt Chapter 2, Number 4, Part a
prompt Is this [CLEINT_VIEW] view walid?  If not, list the Oracle erro rnumber(s) and message(s) you find
prompt It is Invalid with this error message: "Line # = 0 Column # = 0 Error Text = ORA-00942: table or view does not exist"

prompt Chapter 2, Number 4, Part b
prompt How can this view be corrected?
prompt This can be corrected by changing the table name from CLIENTS to CLIENT as CLIENTS does not exist.

prompt Chapter 2, Number 4, Part c
prompt Fix the view
prompt ok, I fixed it and it is now valid

prompt Chapter 2, Number 4, Part d
prompt Save the DDL for the corrected view in your solutions direcotry in ho0204.sql
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

prompt Chapter 2, Number 5, Part a
prompt Change the password of the CLASSMATE user to STUDENT
prompt I did this by, within the EM, going to Security/Users and double-clicking on CLASSMATE
prompt A box pops up whin which I can enter & confirm my password

prompt Chapter 2, Number 5, part b
prompt Using SQL*Plus, change CLASSMATE password back to CLASSPASS
alter user classmate identified by CLASSPASS;






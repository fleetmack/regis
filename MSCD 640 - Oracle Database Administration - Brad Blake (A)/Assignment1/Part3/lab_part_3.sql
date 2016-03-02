spool U:\regis\MSCD640\Assignment1\Part3\lab11-14.txt
set pagesize 700
set linesize 700
connect classmate/classpass@remote40116.world
prompt ****** Bryan Mack **********
prompt *** Assignment 1, Part 3 ***
prompt **** Submitted 2-26-2008  *****
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 11, Number 1
prompt *****************************************************************************
prompt Write stored procedure getemployees to show names from ch10employee table
prompt *****************************************************************************
SET SERVEROUTPUT ON;
EXEC DBMS_OUTPUT.ENABLE(1000000);
CREATE OR REPLACE PROCEDURE getemployees
IS
BEGIN
DECLARE
CURSOR NNAME IS 
	SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
          FROM CH10EMPLOYEE;
BEGIN
	FOR RCLIENT IN NNAME LOOP
		DBMS_OUTPUT.PUT_LINE(RCLIENT.FIRST_NAME||' '||RCLIENT.LAST_NAME);
 	END LOOP;
END;
END;
/
EXEC getemployees;
/
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 11, Number 2
prompt *****************************************************************************
prompt Write stored function getinitials
prompt *****************************************************************************
SET SERVEROUTPUT ON;
EXEC DBMS_OUTPUT.ENABLE(1000000);
CREATE OR REPLACE FUNCTION getinitials
aS
BEGIN
DECLARE
CURSOR NNAME IS 
	SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
          FROM CH10EMPLOYEE;
BEGIN
	FOR RCLIENT IN NNAME LOOP
		DBMS_OUTPUT.PUT_LINE(SUBSTR(RCLIENT.FIRST_NAME,1,1)||'.'||SUBSTR(RCLIENT.LAST_NAME,1,1));
 	END LOOP;
END;
END;
/
PROMPT I cannot get this to compile without errors, have tried for literally hours, no clue what i'm doing wrong
prompt Here are my errors I can't figure out
show errors;
PROMPT I ensure you the following cursor works to give the results requested though
DECLARE
CURSOR NNAME IS 
	SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
          FROM CH10EMPLOYEE;
BEGIN
	FOR RCLIENT IN NNAME LOOP
		DBMS_OUTPUT.PUT_LINE(SUBSTR(RCLIENT.FIRST_NAME,1,1)||'.'||SUBSTR(RCLIENT.LAST_NAME,1,1));
 	END LOOP;
END;
/
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 11, Number 3
prompt *****************************************************************************
prompt Modify num 1 to use function from num 2
prompt *****************************************************************************
SET SERVEROUTPUT ON;
EXEC DBMS_OUTPUT.ENABLE(1000000);
CREATE OR REPLACE PROCEDURE getemployees
IS
BEGIN
DECLARE
CURSOR NNAME IS 
	SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
          FROM CH10EMPLOYEE;
BEGIN
	FOR RCLIENT IN NNAME LOOP
		DBMS_OUTPUT.PUT_LINE(SUBSTR(RCLIENT.FIRST_NAME,1,1)||'.'||SUBSTR(RCLIENT.LAST_NAME,1,1));
 	END LOOP;
END;
END;
/
EXEC getemployees;
/
connect system/oracle@remote40116.world
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 12, Number 1
prompt *****************************************************************************
prompt Create 3 users who each have 10mb of tablespace in user_auto table
prompt *****************************************************************************
CREATE USER cons01
IDENTIFIED BY blah1
DEFAULT TABLESPACE user_auto
QUOTA 10M ON user_auto;
CREATE USER cons02
IDENTIFIED BY blah2
DEFAULT TABLESPACE user_auto
QUOTA 10M ON user_auto;
CREATE USER cons03
IDENTIFIED BY blah3
DEFAULT TABLESPACE user_auto
QUOTA 10M ON user_auto;
prompt *****************************************************************************
prompt create a profile for the new consultants and assign it to 3 new users
prompt *****************************************************************************
CREATE PROFILE tempconsult LIMIT
PASSWORD_LIFE_TIME 7
IDLE_TIME 10;
ALTER USER cons01
PROFILE tempconsult;
ALTER USER cons02
PROFILE tempconsult;
ALTER USER cons03
PROFILE tempconsult;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 12, Number 2
prompt *****************************************************************************
prompt Alter the users from number 1, new tablespace, longer idle time, etc.
prompt *****************************************************************************
prompt Allow 30 Minute Idle Time for this Profile
ALTER PROFILE tempconsult LIMIT
IDLE_TIME 30;
prompt Switch them over to Users tablespace instead of user_auto
ALTER USER cons01
DEFAULT TABLESPACE users
QUOTA 10M ON users
QUOTA 0 ON user_auto;
ALTER USER cons02
DEFAULT TABLESPACE users
QUOTA 10M ON users
QUOTA 0 ON user_auto;
ALTER USER cons03
DEFAULT TABLESPACE users
QUOTA 10M ON users
QUOTA 0 ON user_auto;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 12, Number 3
prompt *****************************************************************************
prompt Drop the three users, while keeping the data of only user cons03
prompt *****************************************************************************
DROP USER cons01 CASCADE;
DROP USER cons02 CASCADE;
DROP USER cons03;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 12, Number 4
prompt *****************************************************************************
prompt Display the locked and expired users
prompt *****************************************************************************
SELECT username, account_status, lock_date, expiry_date
  FROM dba_users
 WHERE account_status <> 'OPEN';
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 12, Number 5
prompt *****************************************************************************
prompt set up auditing on the classified_section and classified_ad tables
prompt *****************************************************************************
AUDIT SELECT ON classmate.classified_section
WHENEVER NOT SUCCESSFUL;
AUDIT SELECT ON classmate.classified_ad
WHENEVER NOT SUCCESSFUL;
prompt Query the results of this audit
SELECT username, timestamp, obj_name, action_name, comment_text
  FROM dba_audit_object
 WHERE obj_name IN ('CLASSMATE.CLASSIFIED_AD','CLASSMATE.CLASSIFIED_SECTION');
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 12, Number 6
prompt *****************************************************************************
prompt WHAT PRIVILEGES CAN BE GIVEN to the following schema objects
prompt *****************************************************************************
SELECT object_name, object_type
  FROM dba_objects
 WHERE object_name IN ('CUSTOMER','EDITOR_INFO','CLIENT_VIEW','CUSTOMER_ADDRESS');
prompt Customer(Table): Alter, Delete, Debug, Flashback, Index, Insert, References, Select, Update
prompt Customer_Address(Table): ALTER, DELETE, DEBUG, FLASHBACK, INDEX, INSERT, REFERENCES, SELECT, UPDATE
prompt Editor_info(Type): EXECUTE
prompt client_view(view): DELETE, DEBUG, FLASHBACK, INSERT, REFERENCES, SELECT, UPDATE
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 12, Number 7
prompt *****************************************************************************
prompt audit a user who may be a threat: NOTE, BOOK SAYS to audit 3 user names
prompt but the only of the three that we have in this DB is CLASSMATE, so I will only audit that user
prompt *****************************************************************************
AUDIT UPDATE TABLE BY CLASSMATE;
AUDIT DELETE ANY TABLE BY CLASSMATE;
prompt Query the audit resutls to show user name, operating system, and terminal
SELECT os_username, username, terminal
  FROM dba_audit_trail;
connect system/oracle@remote40116.world
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 12, Number 8
prompt *****************************************************************************
prompt note: I just created a user studentb as I need him for this question, too
prompt Create MAKEINDEX role, define it as stated in book, give to studentb.
prompt *****************************************************************************
CREATE ROLE makeindex IDENTIFIED BY makeindex;
GRANT SELECT, INDEX on classmate.customer TO makeindex;
GRANT SELECT, INDEX on classmate.customer_address TO makeindex;
GRANT SELECT, INDEX on classmate.want_ad TO makeindex;
GRANT CREATE ANY VIEW TO makeindex;
GRANT CREATE ANY TABLE TO makeindex;
prompt Grant this role to the studentb user
GRANT makeindex TO studentb;
prompt grant CONNECT to studentb
GRANT CONNECT TO studentb;
prompt Log on as studentb and create a view
connect studentb/classpass@remote40116.world
prompt CREATE VIEW test_studentb
prompt AS
prompt (SELECT customer_id
prompt    FROM classmate.customer);
CREATE VIEW test_studentb
AS
(SELECT customer_id
FROM classmate.customer);
prompt I have no idea why this won't work, I have given it the right to create a view
prompt I can select from the table
select customer_id from classmate.customer;
prompt I can create a table
drop table test8;
create table test8 (id_number varchar2(8));
prompt But I cannot make a view, no idea why, thought the create any view took care of that
prompt Running out of time, need to turn this in
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 13, Number 1
prompt *****************************************************************************
prompt Ensure that statistics are automated for all tables
prompt *****************************************************************************
prompt THe fact that the following statement returns TYPICAL shows they are automated
connect sys/oracle@remote40116.world as sysdba
show parameter statistics_level
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 13, Number 2
prompt *****************************************************************************
prompt Disable automatic stats
prompt *****************************************************************************
connect sys/oracle@remote40116.world as sysdba
EXEC DBMS_SCHEDULER.DISABLE('GATHER_STATS_JOB');
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 13, Number 3
prompt *****************************************************************************
prompt enable automatic stats and turn off dynamic sampling at the system level
prompt *****************************************************************************
EXEC DBMS_SCHEDULER.ENABLE('GATHER_STATS_JOB');
ALTER SYSTEM SET OPTIMIZER_DYNAMIC_SAMPLING = 0;
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 13, Number 4
prompt *****************************************************************************
prompt Find and resolve a lock on a table in the database using database control
prompt *****************************************************************************
prompt Step 1 - I went to the Targets tab (after starting up my db through sql plus)
prompt Step 2 - I went to the databases tab
prompt Step 3 - I selected my database from the list
prompt Step 4 - I logged in as sys as sysdba
prompt Step 5 - I selected the Performance tab
prompt Step 6 - I select All Instance Locks
prompt Step 7 - I would locate my table where the lock is from the list below
prompt Step 8 - I would select this locked table and click Kill Session up top
prompt Step 9 - I would ensure Kill Immediate is checked, then click Yes
prompt Step 10 - I would verify that the lock has been removed.
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 14, Number 1
prompt *****************************************************************************
prompt Change warning threshold for active area to 90%
prompt *****************************************************************************
prompt Under Targets/Metrics I set the view dropdown box to Metrics with Thresholds
prompt Then I adjusted the value to 90 percent in the top row of the Warnings Thresholds
prompt column, which is for archive area used percentage. I then clicked ok and got an
prompt "Update Succeeded" message.
prompt *****************************************************************************
prompt *****************************************************************************
prompt Chapter 14, Number 2
prompt *****************************************************************************
prompt Find where metric collection errors are listed
prompt *****************************************************************************
prompt After opening the OEM, Go to Targets and then Databases, click on the Status
prompt of the database you'd like to see. If they exist, Metrics Collection Errors
prompt exist in the Outage Type column.

spool off;
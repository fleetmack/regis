DROP TABLE CLASSMATE.CH08SURGERY;
DROP TYPE CLASSMATE.PROCEDURES_ARRAY;
REM
CREATE TABLE CLASSMATE.CH08SURGERY 
(SURGERY_ID NUMBER(10) NOT NULL, 
DOCTOR_NAME VARCHAR2(40) NOT NULL,
PATIENT_FISRT_NAME VARCHAR2(10) NOT NULL, 
PATIENT_LAST_NAME VARCHAR2(30) NOT NULL,
SURGERY_DATE DATE NOT NULL, 
PROCEDURES VARCHAR2(100) NOT NULL, 
CONSTRAINT SURGERY_PK PRIMARY KEY(SURGERY_ID))
TABLESPACE USERS;
REM
CREATE TYPE CLASSMATE.PROCEDURES_ARRAY 
  AS VARRAY(15) OF CHAR(8)
/
REM
INSERT INTO CH08SURGERY VALUES 
(1,'Dr. Sheriton-DeAngelos','Joe','Bailey',
'12-JAN-2004','Knee replacement');
REM
INSERT INTO CH08SURGERY VALUES 
(2,'Dr. Smith','Amy','South',
'14-JAN-2004','Repair broken arm');
INSERT INTO CH08SURGERY VALUES 
(3,'Dr. Angelo','Marge','Summers',
'15-JAN-2004','Remove gall bladder');
INSERT INTO CH08SURGERY VALUES 
(4,'Dr. Sheriton-DeAngelos','Thomas','Blankenstone',
'30-MAY-2004','Remove gall bladder');
INSERT INTO CH08SURGERY VALUES 
(5,'Dr. Angelo','Leroy','Brown',
'22-OCT-2004','Repair nose');
INSERT INTO CH08SURGERY VALUES 
(10,'Dr. Angelo','Marge','Summers',
'12-MAR-2004','Knee replacement');
INSERT INTO CH08SURGERY VALUES 
(6,'Dr. Smith','Heather','Rain',
'11-FEB-2004','C-section');
INSERT INTO CH08SURGERY VALUES 
(42,'Dr. Angelo','Marge','Summers',
'05-JUL-2004','Laser eye surgery');
INSERT INTO CH08SURGERY VALUES 
(7,'Dr. Angelo','Horace','Levins',
'12-APR-2004','Remove gall bladder');
INSERT INTO CH08SURGERY VALUES 
(12,'Dr. Sheriton-DeAngelos','Bill','Holmes',
'01-MAR-2004','Remove kidney stones');
INSERT INTO CH08SURGERY VALUES 
(33,'Dr. Sheriton-DeAngelos','Martin','Lantern',
'11-SEP-2004','Remove gall bladder');
COMMIT;
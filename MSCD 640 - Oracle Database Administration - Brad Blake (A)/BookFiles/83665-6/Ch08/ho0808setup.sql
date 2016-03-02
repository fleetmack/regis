DROP TABLE CLASSMATE.CH08FAMILYTIES
/
DROP TYPE CLASSMATE.CH08CHILDINFO
/
CREATE TYPE CLASSMATE.CH08CHILDINFO AS OBJECT 
(NAME_OF_CHILD VARCHAR2(30), BIRTHDATE DATE, SEX CHAR(1))
/
CREATE TABLE CLASSMATE.CH08FAMILYTIES
(LAST_NAME VARCHAR2(30) NOT NULL,
 PARENT_ONE VARCHAR2(50),
 PARENT_TWO VARCHAR2(50),
 CHILD_DATA CLASSMATE.CH08CHILDINFO)
/
INSERT INTO CLASSMATE.CH08FAMILYTIES VALUES
('Brown','Janice Brown','Jim Brown', 
CH08CHILDINFO('Little Sue', '01-JUL-99','F'));

INSERT INTO CLASSMATE.CH08FAMILYTIES VALUES
('Domino','Lucille Domino','Carlos Domino', 
CH08CHILDINFO('Tia','30-JUN-94','F'));

INSERT INTO CLASSMATE.CH08FAMILYTIES VALUES
('Troy','Anne Marshall-Troy','Joeph Troy', 
CH08CHILDINFO('Peter','11-SEP-01','M'));

COMMIT;

ALTER TYPE CLASSMATE.CH08CHILDINFO ADD ATTRIBUTE
NICKNAME VARCHAR2(20) INVALIDATE
/
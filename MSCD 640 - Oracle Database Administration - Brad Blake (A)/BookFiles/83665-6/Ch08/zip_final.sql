CREATE TABLE ZIPREFERENCES
(ZIPCODE VARCHAR2(10) NOT NULL, 
 CITY VARCHAR2(40) NOT NULL, 
 STATE VARCHAR2(10) NOT NULL, 
 PROVINCE VARCHAR2(10) NOT NULL, 
 COUNTRY VARCHAR2(20) NOT NULL, 
 CONSTRAINT ZIP_PK PRIMARY KEY(ZIPCODE)) 
ORGANIZATION INDEX
TABLESPACE USERS
PCTTHRESHOLD 20
OVERFLOW TABLESPACE USERS
STORAGE (INITIAL 64K NEXT 32K 
MAXEXTENTS 50 PCTINCREASE 0);

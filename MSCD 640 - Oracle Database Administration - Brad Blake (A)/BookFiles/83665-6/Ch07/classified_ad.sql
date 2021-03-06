CREATE TABLE CLASSIFIED_AD
(AD_NO NUMBER NOT NULL,
 SECTION_NO NUMBER NOT NULL,
 AD_TEXT VARCHAR2(1000),
 CUSTOMER_ID NUMBER,
 INTAKE_EDITOR_ID NUMBER, 
 PRICE NUMBER (6,2),
 PLACED_DATE DATE,
 "Run Start Date" TIMESTAMP WITH LOCAL TIME ZONE,
 "Run End Date" TIMESTAMP WITH LOCAL TIME ZONE,
 RUN_DAYS INTERVAL DAY(3) TO SECOND(0)) 
 TABLESPACE USERS
 STORAGE (INITIAL 2M NEXT 2M MAXEXTENTS 10);

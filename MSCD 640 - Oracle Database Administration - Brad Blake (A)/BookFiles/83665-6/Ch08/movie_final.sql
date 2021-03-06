CREATE TABLE MOVIEMAKER 
(MOVIE_ID NUMBER(10),
 MOVIE_TITLE VARCHAR2(30),
 PRODUCER VARCHAR2(30),
 REVIEW CLOB,
 MOVIE BLOB)
LOB (REVIEW, MOVIE) STORE AS 
    (TABLESPACE USERS  
     DISABLE STORAGE IN ROW
     CHUNK 32768
     STORAGE (INITIAL 64K NEXT 32K MAXEXTENTS UNLIMITED));

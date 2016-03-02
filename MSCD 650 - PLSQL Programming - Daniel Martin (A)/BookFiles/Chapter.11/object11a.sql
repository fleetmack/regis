CREATE OR REPLACE TYPE addr_ot AS OBJECT
  (street1 VARCHAR2(25),
   street2 VARCHAR2(25),
   city VARCHAR2(25),
   state CHAR(2),
   zip NUMBER(9) );
/

spool c:\2-5.txt
prompt Bryan Mack
prompt Assignment 2 - Week 5
prompt Chapter 6 Hands-On Assigments
SET LINESIZE 300
SET SERVEROUTPUT ON
@c:\c7Dbcreate.sql
prompt ****************************************
prompt ****************************************
prompt Assignment 7-1: Creating a package
prompt ****************************************
prompt ****************************************
prompt 7-1:1 Locate assignment07-01.txt - hey, i found it!
prompt 7-1:2 open file
prompt 7-1:3 copy and paste code
prompt 7-1:4 open sql plus
prompt 7-1:5 run code - shoudl create an error
CREATE OR REPLACE PACKAGE order_info_pkg IS
 FUNCTION ship_name_pf  
   (p_basket IN NUMBER)
   RETURN VARCHAR2;
 PROCEDURE basket_info_pp
  (p_basket IN NUMBER,
   p_shop OUT NUMBER,
   p_date OUT DATE);
END;
/
CREATE OR REPLACE PACKAGE BODY order_info_pkg IS
 FUNCTION ship_name_pf  
   (p_basket IN NUMBER)
   RETURN VARCHAR2
  IS
   lv_name_txt VARCHAR2(25);
 BEGIN
  SELECT shipfirstname||' '||shiplastname
   INTO lv_name_txt
   FROM bb_basket
   WHERE idBasket = p_basket;
  RETURN lv_name_txt;
 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('Invalid basket id');
 END ship_name_pf;
 PROCEDURE basket_inf_pp
  (p_basket IN NUMBER,
   p_shop OUT NUMBER,
   p_date OUT DATE)
  IS
 BEGIN
   SELECT idshopper, dtordered
    INTO p_shop, p_date
    FROM bb_basket
    WHERE idbasket = p_basket;
 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('Invalid basket id');
 END basket_inf_pp;
END;
/
prompt 7-1:6 show the errors
show errors
prompt 7-1:7 fix the procedure
prompt 7-1:8 re-run the package correctly
CREATE OR REPLACE PACKAGE order_info_pkg IS
 FUNCTION ship_name_pf  
   (p_basket IN NUMBER)
   RETURN VARCHAR2;
 PROCEDURE basket_info_pp
  (p_basket IN NUMBER,
   p_shop OUT NUMBER,
   p_date OUT DATE);
END;
/
CREATE OR REPLACE PACKAGE BODY order_info_pkg IS
 FUNCTION ship_name_pf  
   (p_basket IN NUMBER)
   RETURN VARCHAR2
  IS
   lv_name_txt VARCHAR2(25);
 BEGIN
  SELECT shipfirstname||' '||shiplastname
   INTO lv_name_txt
   FROM bb_basket
   WHERE idBasket = p_basket;
  RETURN lv_name_txt;
 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('Invalid basket id');
 END ship_name_pf;
 PROCEDURE basket_info_pp
  (p_basket IN NUMBER,
   p_shop OUT NUMBER,
   p_date OUT DATE)
  IS
 BEGIN
   SELECT idshopper, dtordered
    INTO p_shop, p_date
    FROM bb_basket
    WHERE idbasket = p_basket;
 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('Invalid basket id');
 END basket_info_pp;
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 7-2: Using packaged program units
prompt ****************************************
prompt ****************************************
prompt 7-2:1 open sql plus
prompt 7-2:2 create the order_info_pkg
CREATE OR REPLACE PACKAGE order_info_pkg IS
 FUNCTION ship_name_pf  
   (p_basket IN NUMBER)
   RETURN VARCHAR2;
 PROCEDURE basket_info_pp
  (p_basket IN NUMBER,
   p_shop OUT NUMBER,
   p_date OUT DATE);
END;
/
CREATE OR REPLACE PACKAGE BODY order_info_pkg IS
 FUNCTION ship_name_pf  
   (p_basket IN NUMBER)
   RETURN VARCHAR2
  IS
   lv_name_txt VARCHAR2(25);
 BEGIN
  SELECT shipfirstname||' '||shiplastname
   INTO lv_name_txt
   FROM bb_basket
   WHERE idBasket = p_basket;
  RETURN lv_name_txt;
 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('Invalid basket id');
 END ship_name_pf;
 PROCEDURE basket_info_pp
  (p_basket IN NUMBER,
   p_shop OUT NUMBER,
   p_date OUT DATE)
  IS
 BEGIN
   SELECT idshopper, dtordered
    INTO p_shop, p_date
    FROM bb_basket
    WHERE idbasket = p_basket;
 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('Invalid basket id');
 END basket_info_pp;
END;
/
prompt 7-2:3 invoke the procedure and the function within an anonymous block
VARIABLE hold_ship_name VARCHAR2(30)
VARIABLE p_shop_proc NUMBER
VARIABLE p_date VARCHAR2(30)
EXECUTE order_info_pkg.basket_info_pp(12,:p_shop_proc, :p_date);
BEGIN
:hold_ship_name := order_info_pkg.ship_name_pf(12);
dbms_output.put_line(:hold_ship_name);
dbms_output.put_line('Shopper: '||:p_shop_proc||' Date: '||:p_date);
END;
/
prompt 7-2:4 call the function using a select statement
prompt NOTE: this shows up blank but if you cut and paste my code into sql plus the result shows up
SELECT order_info_pkg.ship_name_pf(idbasket)
FROM bb_basket
WHERE idbasket = 12;
prompt ****************************************
prompt ****************************************
prompt Assignment 7-3 Creating a package with private program units
prompt ****************************************
prompt ****************************************
prompt 7-3:1 open code and review it
prompt 7-3:2 modify to add basket_info_pp procedure
CREATE OR REPLACE PACKAGE order_info_pkg IS
 PROCEDURE basket_info_pp
  (p_basket IN NUMBER,
   p_shop OUT NUMBER,
   p_date OUT DATE,
   p_name OUT VARCHAR2);
END;
/
CREATE OR REPLACE PACKAGE BODY order_info_pkg IS
 FUNCTION ship_name_pf  
   (p_basket IN NUMBER)
   RETURN VARCHAR2
  IS
   lv_name_txt VARCHAR2(25);
 BEGIN
  SELECT shipfirstname||' '||shiplastname
   INTO lv_name_txt
   FROM bb_basket
   WHERE idBasket = p_basket;
  RETURN lv_name_txt;
 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('Invalid basket id');
 END ship_name_pf;
 PROCEDURE basket_info_pp
  (p_basket IN NUMBER,
   p_shop OUT NUMBER,
   p_date OUT DATE,
   p_name OUT VARCHAR2)
  IS
 BEGIN
   SELECT idshopper, dtordered
    INTO p_shop, p_date
    FROM bb_basket
    WHERE idbasket = p_basket;
    p_name := ship_name_pf(p_basket);
 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('Invalid basket id');
 END basket_info_pp;
END;
/
prompt 7-3:3 execute the basket_info_pp procedure
prompt NOTE: below the name isn't showing in the results, but if you cut/paste my code into sql plus it shows up
variable g_shop number
variable g_date varchar2(30)
variable g_name varchar2(30)
EXECUTE order_info_pkg.basket_info_pp(12,:g_shop, :g_date, :g_name)
BEGIN
dbms_output.put_line('Shopper ID: '||:g_shop||' Date Ordered: '||:g_date||' Name: '||:g_name);
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 7-4 Using packaged variables
prompt ****************************************
prompt ****************************************
prompt 7-4:1 creat a function that'll verify an input shopper id and such
CREATE OR REPLACE FUNCTION login
(user_in IN bb_shopper.username%type,
password_in IN bb_shopper.password%type)
RETURN VARCHAR2
IS
 y_or_n VARCHAR2(1) := 'N';
 username_hold  bb_shopper.username%type;
 password_hold  bb_shopper.password%type;
BEGIN
  SELECT b.username, b.password 
   INTO username_hold, password_hold
  FROM bb_shopper	b
 WHERE user_in = b.username 
   AND password_in = b.password;
IF user_in = username_hold AND password_in = password_hold THEN y_or_n := 'Y';
ELSE y_or_n := 'N';
END IF;
 RETURN y_or_n;
END;
/
prompt 7-4:2 create host variable to hold function value
VARIABLE g_ck VARCHAR2
prompt 7-4:3 execute using user: gma1 pswd: goofy
BEGIN
:g_ck := login('gma1','goofy');
END;
/
prompt 7-4:4 print the value
print g_ck
prompt 7-4:5 place function in package and add other 2 variables
CREATE OR REPLACE PACKAGE login_pkg
IS
shopperid bb_shopper.idshopper%type;
shopper_zip3 bb_shopper.zipcode%type;
FUNCTION login
(user_in IN bb_shopper.username%type,
password_in IN bb_shopper.password%type)
RETURN VARCHAR2;
END;
/

CREATE OR REPLACE PACKAGE BODY login_pkg
IS
FUNCTION login
(user_in IN bb_shopper.username%type,
password_in IN bb_shopper.password%type)
RETURN VARCHAR2
IS
 y_or_n VARCHAR2(1) := 'N';
 username_hold  bb_shopper.username%type;
 password_hold  bb_shopper.password%type;
 shopperid_hold bb_shopper.idshopper%type;
 zip_hold	bb_shopper.zipcode%type;
BEGIN
  SELECT b.username, b.password, b.idshopper, b.zipcode
   INTO username_hold, password_hold, shopperid_hold, zip_hold
  FROM bb_shopper	b
 WHERE user_in = b.username 
   AND password_in = b.password;
 shopperid := shopperid_hold;
 shopper_zip3 := substr(zip_hold,1,3);
IF user_in = username_hold AND password_in = password_hold THEN y_or_n := 'Y';
ELSE y_or_n := 'N';
END IF;
 RETURN y_or_n;
 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('Password or Username incorrect');
END;
END;
/
prompt 7-4:6 use host variable to test packaged procedure using "gma1" and "goofy"
VARIABLE g_ck2 VARCHAR2
BEGIN
:g_ck2 := login_pkg.login('gma1','goofy');
END;
/
print g_ck2
prompt 7-4:7 use dbms_output to show the packaged variable values
BEGIN
DBMS_OUTPUT.PUT_LINE('Shopper ID: '||login_pkg.shopperid||' '||'Shopper Last 3 of Zip: '||login_pkg.shopper_zip3);
END;
/

prompt ****************************************
prompt ****************************************
prompt Assignment 7-5 Packaging overloading
prompt ****************************************
prompt ****************************************
CREATE OR REPLACE PACKAGE shop_query_pkg
IS
PROCEDURE cust_lookup
(shopperid IN bb_shopper.idshopper%type,
fname	  OUT bb_shopper.firstname%type,
lname     OUT bb_shopper.lastname%type,
o_city    OUT bb_shopper.city%type,
o_state   OUT bb_shopper.state%type,
o_phone   OUT bb_shopper.phone%type,
o_email   OUT bb_shopper.email%type);
PROCEDURE cust_lookup
(shopperid IN bb_shopper.lastname%type,
fname	  OUT bb_shopper.firstname%type,
lname     OUT bb_shopper.lastname%type,
o_city    OUT bb_shopper.city%type,
o_state   OUT bb_shopper.state%type,
o_phone   OUT bb_shopper.phone%type,
o_email   OUT bb_shopper.email%type);
END;
/
CREATE OR REPLACE PACKAGE BODY shop_query_pkg
IS
PROCEDURE cust_lookup
(shopperid IN bb_shopper.idshopper%type,
fname	  OUT bb_shopper.firstname%type,
lname     OUT bb_shopper.lastname%type,
o_city    OUT bb_shopper.city%type,
o_state   OUT bb_shopper.state%type,
o_phone   OUT bb_shopper.phone%type,
o_email   OUT bb_shopper.email%type)
IS
BEGIN
	SELECT firstname, lastname, city, state, phone, email
 	INTO fname, lname, o_city, o_state, o_phone, o_email
	FROM bb_shopper
	WHERE shopperid = idshopper;
END;
PROCEDURE cust_lookup
(shopperid IN bb_shopper.lastname%type,
fname	  OUT bb_shopper.firstname%type,
lname     OUT bb_shopper.lastname%type,
o_city    OUT bb_shopper.city%type,
o_state   OUT bb_shopper.state%type,
o_phone   OUT bb_shopper.phone%type,
o_email   OUT bb_shopper.email%type)
IS
BEGIN
	SELECT firstname, lastname, city, state, phone, email
 	INTO fname, lname, o_city, o_state, o_phone, o_email
	FROM bb_shopper
	WHERE shopperid = lastname;
END;
END;
/
prompt test it with user id 23
VARIABLE fname2 VARCHAR2(30)
VARIABLE lname2 VARCHAR2(30)
VARIABLE o_city2 VARCHAR2(30)
VARIABLE o_state2 CHAR(2)
VARIABLE o_phone2 VARCHAR2(30)
VARIABLE o_email2 VARCHAR2(30)
EXECUTE shop_query_pkg.cust_lookup(23,:fname2, :lname2, :o_city2, :o_state2, :o_phone2, :o_email2);
print :fname2
print :lname2
print :o_city2
print :o_state2
print :o_phone2
print :o_email2
prompt test it with Ratman
VARIABLE fname2 VARCHAR2(30)
VARIABLE lname2 VARCHAR2(30)
VARIABLE o_city2 VARCHAR2(30)
VARIABLE o_state2 CHAR(2)
VARIABLE o_phone2 VARCHAR2(30)
VARIABLE o_email2 VARCHAR2(30)
EXECUTE shop_query_pkg.cust_lookup('Ratman',:fname2, :lname2, :o_city2, :o_state2, :o_phone2, :o_email2);
begin
dbms_output.put_line(:fname2||' '||:lname2||' '||:o_city2||' '||:o_state2||' '||:o_phone2||' '||:o_email2);
end;
/
print :fname2
print :lname2
print :o_city2
print :o_state2
print :o_phone2
print :o_email2
prompt ****************************************
prompt ****************************************
prompt Assignment 7-6 Creating a package with specification only
prompt ****************************************
prompt ****************************************
CREATE OR REPLACE PACKAGE tax_rate_pkg
IS
pv_tax_nc NUMBER;
pv_tax_tx NUMBER;
pv_tax_tn NUMBER;
END;
/

CREATE OR REPLACE PACKAGE BODY tax_rate_pkg
IS
BEGIN
pv_tax_nc := .035;
pv_tax_tx := .05;
pv_tax_tn := .02;
END;
/
BEGIN
DBMS_OUTPUT.PUT_LINE('pv_tax_nc = '||tax_rate_pkg.pv_tax_nc);
DBMS_OUTPUT.PUT_LINE('pv_tax_tx = '||tax_rate_pkg.pv_tax_tx);
DBMS_OUTPUT.PUT_LINE('pv_tax_tn = '||tax_rate_pkg.pv_tax_tn);
END;
/

@c:\c8Dbcreate.sql
prompt ****************************************
prompt ****************************************
prompt Assignment 8-1 Reviewing dependency information in the data dictionary
prompt ****************************************
prompt ****************************************
prompt 8-1:1 open sql plus and describe user_objects
describe user_objects
prompt 8-1:2
SELECT object_name, status, timestamp
FROM user_objects
WHERE object_type = 'PROCEDURE';
prompt 8-1:3 describe user dependencies
describe user_dependencies
prompt 8-1:4 execute that query
COLUMN name FORMAT a15
SELECT name, type
FROM user_dependencies
WHERE referenced_name = 'BB_BASKET';
prompt ****************************************
prompt ****************************************
prompt Assignment 8-2 Testing dependencies on packaged program units
prompt ****************************************
prompt ****************************************
prompt 8-2:1 review code for assignmetn08-02.txt
prompt 8-2:2 copy and paste code (and run code for 8-2:3)
CREATE OR REPLACE FUNCTION status_desc_sf
  (p_stage IN NUMBER)
  RETURN VARCHAR2
 IS
  lv_stage_txt VARCHAR2(30);
BEGIN
 IF p_stage = 1 THEN
   lv_stage_txt := 'Order Submitted';
 ELSIF p_stage = 2 THEN
   lv_stage_txt := 'Accepted, sent to shipping';
 ELSIF p_stage = 3 THEN
   lv_stage_txt := 'Backordered';
 ELSIF p_stage = 4 THEN
   lv_stage_txt := 'Cancelled';
 ELSIF p_stage = 5 THEN
   lv_stage_txt := 'Shipped';
 END IF;
 RETURN lv_stage_txt;
END;
/
CREATE OR REPLACE PROCEDURE status_check_sp
  (p_bask IN NUMBER,
   p_stage OUT NUMBER,
   p_desc OUT VARCHAR2)
 IS
BEGIN
  SELECT idstage
   INTO p_stage
   FROM bb_basketstatus
   WHERE idBasket = p_bask;
  p_desc := status_desc_sf(p_stage);
END;
/  
prompt 8-2:3 verify validity of objects
SELECT object_name, status
FROM user_objects
WHERE object_name IN
	('STATUS_CHECK_SP','STATUS_DESC_SF');
prompt 8-2:4 modify the function
CREATE OR REPLACE FUNCTION status_desc_sf
  (p_stage IN NUMBER)
  RETURN VARCHAR2
 IS
  lv_stage_txt VARCHAR2(30);
BEGIN
 IF p_stage = 1 THEN
   lv_stage_txt := 'Order Submitted';
 ELSIF p_stage = 2 THEN
   lv_stage_txt := 'Accepted, sent to shipping';
 ELSIF p_stage = 3 THEN
   lv_stage_txt := 'Backordered';
 ELSIF p_stage = 4 THEN
   lv_stage_txt := 'Cancelled';
 ELSIF p_stage = 5 THEN
   lv_stage_txt := 'Shipped';
 ELSIF p_stage = 6 THEN
    lv_stage_txt := 'Credit Card Not Approved';
 END IF;
 RETURN lv_stage_txt;
END;
/
prompt 8-2:5 test if function is still valid
SELECT object_name, status
FROM user_objects
WHERE object_name IN
	('STATUS_CHECK_SP','STATUS_DESC_SF');
prompt Looks invalid to me now
prompt 8-2:6 Invoke the invalid procedure
VARIABLE g_stage NUMBER
VARIABLE g_desc VARCHAR2(30)
EXECUTE status_check_sp(13,:g_stage,:g_desc);
prompt 8-2:7 check if it's valid now
SELECT object_name, status
FROM user_objects
WHERE object_name IN
	('STATUS_CHECK_SP','STATUS_DESC_SF');
prompt Ta Da!
prompt ****************************************
prompt ****************************************
prompt Assignment 8-3 Testing dependencies on packaged program units
prompt ****************************************
prompt ****************************************
prompt 8-3:1 review assignment 08-03.txt
prompt 8-3:2 copy and past
prompt 8-3:3 run the code
CREATE OR REPLACE PACKAGE lookup_pkg
 IS
 FUNCTION status_desc_pf
  (p_stage IN NUMBER)
  RETURN VARCHAR2;
END;
/
CREATE OR REPLACE PACKAGE BODY lookup_pkg
 IS
FUNCTION status_desc_pf
  (p_stage IN NUMBER)
  RETURN VARCHAR2
 IS
  lv_stage_txt VARCHAR2(30);
BEGIN
 IF p_stage = 1 THEN
   lv_stage_txt := 'Order Submitted';
 ELSIF p_stage = 2 THEN
   lv_stage_txt := 'Accepted, sent to shipping';
 ELSIF p_stage = 3 THEN
   lv_stage_txt := 'Backordered';
 ELSIF p_stage = 4 THEN
   lv_stage_txt := 'Cancelled';
 ELSIF p_stage = 5 THEN
   lv_stage_txt := 'Shipped';
 END IF;
 RETURN lv_stage_txt;
END;
END;
/
CREATE OR REPLACE PROCEDURE status_check_sp
  (p_bask IN NUMBER,
   p_stage OUT NUMBER,
   p_desc OUT VARCHAR2)
 IS
BEGIN
  SELECT idstage
   INTO p_stage
   FROM bb_basketstatus
   WHERE idBasket = p_bask;
  p_desc := lookup_pkg.status_desc_pf(p_stage);
END;
/  
prompt 8-3:4 verity status
select status
from user_objects
where object_name = 'STATUS_CHECK_SP';
prompt 8-3:5 modify the function
prompt 8-3:6 re-run the package with the function modified
CREATE OR REPLACE PACKAGE lookup_pkg
 IS
 FUNCTION status_desc_pf
  (p_stage IN NUMBER)
  RETURN VARCHAR2;
END;
/
CREATE OR REPLACE PACKAGE BODY lookup_pkg
 IS
FUNCTION status_desc_pf
  (p_stage IN NUMBER)
  RETURN VARCHAR2
 IS
  lv_stage_txt VARCHAR2(30);
BEGIN
 IF p_stage = 1 THEN
   lv_stage_txt := 'Order Submitted';
 ELSIF p_stage = 2 THEN
   lv_stage_txt := 'Accepted, sent to shipping';
 ELSIF p_stage = 3 THEN
   lv_stage_txt := 'Backordered';
 ELSIF p_stage = 4 THEN
   lv_stage_txt := 'Cancelled';
 ELSIF p_stage = 5 THEN
   lv_stage_txt := 'Shipped';
 ELSIF p_stage = 6 THEN
	lv_stage_txt := 'Credit Card Not Approved';
 END IF;
 RETURN lv_stage_txt;
END;
END;
/
CREATE OR REPLACE PROCEDURE status_check_sp
  (p_bask IN NUMBER,
   p_stage OUT NUMBER,
   p_desc OUT VARCHAR2)
 IS
BEGIN
  SELECT idstage
   INTO p_stage
   FROM bb_basketstatus
   WHERE idBasket = p_bask;
  p_desc := lookup_pkg.status_desc_pf(p_stage);
END;
/
prompt 8-3:7 verify validity
select status
from user_objects
where object_name = 'STATUS_CHECK_SP';
prompt ****************************************
prompt ****************************************
prompt Assignment 8-7 Avoiding recompilation errors
prompt ****************************************
prompt ****************************************
prompt 1) use the %type attribute when declaring variables in a procedure or function.  If the
prompt type within a table changes from, for example, a VARCHAR2 to a NUMBER, the referenced variable
prompt would not be changed as %type pulls the type directly from the object.
prompt 2) use "select *" when inserting columns into a procedure.  if a column is added or 
prompt changes names, it won't need to be referenced as the procedure is simply selecting 
prompt everything within the object.
prompt ****************************************
prompt ****************************************
prompt Assignment 8-8 Identifying the types of dependencies
prompt ****************************************
prompt ****************************************
prompt Direct Dependencies: A procedure has an object directly named within its definition.  If this 
prompt named object is modified, the procedure will become invalidated.  It is validated when run
prompt or if manually compiled.
prompt Indirect Dependencies:  A procedure has an object named, and this object has a direct dependency
prompt on another object, which is the indirect object.  When the indirect object is modified,
prompt both the direct dependency object and the object dependant upon that direct dependency both
prompt will become invalidated.  It is validated if run or manually compiled.
prompt Remote Dependencies: A object referenced within a procedure resides within another database.  If
prompt this object is modified, the procedure becomes invalid.  Unlike the other two, this is not
prompt validated until it is run, meaning the procedure will fail the first time it runs.
prompt ****************************************
prompt ****************************************
spool off
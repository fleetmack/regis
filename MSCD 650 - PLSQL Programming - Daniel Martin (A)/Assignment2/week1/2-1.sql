spool c:\2-1.txt
prompt Bryan Mack
prompt Assignment 2 - Week 1
prompt Chapters 1 and 2 Hands-On Assigments
prompt Assignment 1-1 Reviewing SQL and data in the Brewbean's database
prompt Part 1-1:2 (part 1-1:1 was to connect to SQL Plus)
SET LINESIZE 200
SELECT idProduct, productname, price, active, type, idDepartment, stock
FROM bb_product;

prompt  Part 1-1:3
SELECT idshopper, b.idbasket, b.orderplaced, b.dtordered, b.dtcreated
FROM bb_shopper s
INNER JOIN bb_basket b USING (idshopper);

prompt Part 1-1:4
SELECT idProduct, p.productname, pc.categoryname, pd.optionname
FROM bb_product p
INNER JOIN bb_productoption USING (idproduct)
INNER JOIN bb_productoptiondetail pd USING (idoption)
INNER JOIN bb_productoptioncategory pc USING (idoptioncategory);

prompt Part 1-2:1
select distinct(idproduct)
from bb_basketitem
order by idproduct;

prompt Part 1-2:2
prompt Traditional Join
SET LINESIZE 200
SELECT bi.idbasket, bi.idproduct, p.productname, p.description
FROM bb_product	p,
     bb_basketitem	bi
WHERE bi.idproduct = p.idproduct;

prompt ANSI join
SELECT bi.idbasket, bi.idproduct, p.productname, p.description
FROM bb_basketitem bi INNER JOIN bb_product p 
ON(p.idproduct = bi.idproduct);

prompt 1-2:3
prompt Traditional Join
SELECT bi.idbasket, s.lastname, bi.idproduct, p.productname, p.description
FROM bb_product	p,
     bb_basketitem	bi,
     bb_shopper		s,
     bb_basket		b
WHERE bi.idproduct = p.idproduct
  AND bi.idbasket  = b.idbasket
  AND s.idshopper  = b.idshopper;

prompt ANSI join
SELECT bi.idbasket, s.lastname, bi.idproduct, p.productname, p.description
FROM bb_basketitem bi INNER JOIN bb_product p ON(p.idproduct = bi.idproduct)
	INNER JOIN bb_basket b ON (b.idbasket = bi.idbasket)
	INNER JOIN bb_shopper s ON (s.idshopper = b.idshopper);

prompt 1-2:4
SELECT idbasket, idshopper, to_char(dtcreated,'MONTHDD, YYYY')
  FROM bb_basket
WHERE dtcreated = '12-FEB-07';

prompt 1-2:5
select idproduct, count(*)
from bb_basketitem
group by idproduct;

prompt 1-2:6
select idproduct, count(*)
from bb_basketitem
group by idproduct
having count(*) < 3;

prompt 2-7
SELECT idproduct, productname, price
  FROM bb_product
 WHERE price >
	(SELECT avg(price)
           FROM bb_product);

prompt 1-2:8
DROP TABLE contacts;
commit;
CREATE TABLE contacts
(con_id		NUMBER(4) PRIMARY KEY,
company_name 	VARCHAR2(30) NOT NULL,
email 		VARCHAR2(30),
last_date	DATE DEFAULT SYSDATE,
con_cnt		NUMBER(3),
CONSTRAINT ck1 CHECK (con_cnt > 0));
COMMIT;

prompt 1-2:9
INSERT INTO contacts VALUES (1111, 'Apex Corp.', 'talley@apex.org', '07-JAN-79', 2);
INSERT INTO contacts VALUES (2222, 'Playa Del Rey','ben@mrruiz.com',DEFAULT, 3);
commit;

prompt 1-2:10
select email FROM contacts WHERE con_id = 1111;
UPDATE contacts
SET email='porter@apex.org'
WHERE con_id = 1111;
select email FROM contacts WHERE con_id = 1111;
ROLLBACK;
select email FROM contacts WHERE con_id = 1111;
prompt ****************************************
prompt ****************************************
prompt Assignment 1-2: reviewing third-party software tools
prompt Rapid SQL by Embarcadero offers a benefit of SQL Debugger which allows for the programer
prompt to execute a PL/SQL program step-by-step to help pinpoint an error while utilizing a GUI.
prompt This software also has a feature called SQL Profiler which helps, through the GUI, to identify
prompt and repair bottlenecks within PL/SQL programs.
prompt ****************************************
prompt ****************************************
prompt Assignment 1-3: Identifying processing steps
prompt 1) To compute subtotal, take quantity entered * bb_product.price, add all lines together and store this
prompt in a subtotal variable
prompt 2) To computer shipping amount, take sum of quantities entered and display the shipping price from
prompt the table in which shipping information is stored.
prompt 3) When the button is clicked, it must prompt a customer for his or her state, which will then
prompt select a tax percentage from the table, multiply this percentage by the subtotal variable, and 
prompt display this as the tax amount.
prompt 4) The values of the subtotal, shipping, and tax must be added together to display the final total.
prompt 
prompt ****************************************
prompt ****************************************
prompt Assignment 1-4: Using OTN Documentation
prompt Control structures allows a programmer to process data using conditional (IF-THEN_ELSE) statements,
prompt iterative (LOOP) statements, and sequental flow-of-control (GOTO) statements to control the manipulation
prompt of data when utilizing PL/SQL.  An example would be using the following FOR LOOP (as taken from the 
prompt OTN document we were told to pull)
prompt  CREATE TABLE sqr_root_sum (num NUMBER,
prompt				   sq_root NUMBER(6,2),
prompt				   sqr NUMBER,
prompt				   sum_sqrs NUMBER);
prompt DECLARE
prompt	 s PLS_INTEGER;
prompt BEGIN
prompt     FOR i in 1..100 LOOP
prompt      s := (i * (i + 1) * (2*i +1)) / 6;
prompt      INSERT INTO sqr_root_sum VALUES (i, SQRT(i), i*i, s);
prompt      END LOOP;
prompt END;
prompt /
prompt ****************************************
prompt ****************************************
SET SERVEROUTPUT ON
prompt Assignment 2-1: Using scalar variables
DECLARE
	lv_test_date	DATE := '10-DEC-07';
	lv_test_num 	CONSTANT NUMBER(3) := 10;
	lv_test_txt	VARCHAR2(10);
BEGIN
DBMS_OUTPUT.PUT_LINE(lv_test_date);
DBMS_OUTPUT.PUT_LINE(lv_test_num);
lv_test_txt := 'Mack';
DBMS_OUTPUT.PUT_LINE(lv_test_txt);
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 2-3: Using IF Statements
prompt IF statement with an initialized total value of $50 - should generate Low
DECLARE
	lv_total_purchase	NUMBER(5,2) := 50;
	lv_rating		VARCHAR2(5);
BEGIN
	IF lv_total_purchase >= 200 
		THEN lv_rating := 'High';
	ELSIF lv_total_purchase >= 100 AND lv_total_purchase <= 200
		THEN lv_rating := 'Mid';
	ELSIF lv_total_purchase < 100
		THEN lv_rating := 'Low';
	END IF;
	DBMS_OUTPUT.PUT_LINE('Rating = '||lv_rating);
END;
/
prompt IF statement with an initialized total value of $101 - should generate Mid
DECLARE
	lv_total_purchase	NUMBER(5,2) := 101;
	lv_rating		VARCHAR2(5);
BEGIN
	IF lv_total_purchase >= 200 
		THEN lv_rating := 'High';
	ELSIF lv_total_purchase >= 100 AND lv_total_purchase <= 200
		THEN lv_rating := 'Mid';
	ELSIF lv_total_purchase < 100
		THEN lv_rating := 'Low';
	END IF;
	DBMS_OUTPUT.PUT_LINE('Rating = '||lv_rating);
END;
/
prompt IF statement with an initialized total value of $237 - should generate High
DECLARE
	lv_total_purchase	NUMBER(5,2) := 237;
	lv_rating		VARCHAR2(5);
BEGIN
	IF lv_total_purchase >= 200 
		THEN lv_rating := 'High';
	ELSIF lv_total_purchase >= 100 AND lv_total_purchase <= 200
		THEN lv_rating := 'Mid';
	ELSIF lv_total_purchase < 100
		THEN lv_rating := 'Low';
	END IF;
	DBMS_OUTPUT.PUT_LINE('Rating = '||lv_rating);
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 2-4: Using CASE statements
prompt CASE statement with an initialized total value of $55 - should generate low
DECLARE
	lv_total_purchase	NUMBER(5,2) := 55;
	lv_rating		VARCHAR2(5);
BEGIN	
 CASE
	WHEN lv_total_purchase < 100
		THEN lv_rating := 'Low';
	WHEN lv_total_purchase BETWEEN 100 and 199
		THEN lv_rating := 'Mid';
	WHEN lv_total_purchase >= 200
		THEN lv_rating := 'High';
END CASE;
	DBMS_OUTPUT.PUT_LINE('Rating = '||lv_rating);
END;
/
prompt CASE statement with an initialized total value of $123 - should generate Mid
DECLARE
	lv_total_purchase	NUMBER(5,2) := 123;
	lv_rating		VARCHAR2(5);
BEGIN	
 CASE
	WHEN lv_total_purchase < 100
		THEN lv_rating := 'Low';
	WHEN lv_total_purchase BETWEEN 100 and 199
		THEN lv_rating := 'Mid';
	WHEN lv_total_purchase >= 200
		THEN lv_rating := 'High';
END CASE;
	DBMS_OUTPUT.PUT_LINE('Rating = '||lv_rating);
END;
/
prompt CASE statement with an initialized total value of $234 - should generate High
DECLARE
	lv_total_purchase	NUMBER(5,2) := 234;
	lv_rating		VARCHAR2(5);
BEGIN	
 CASE
	WHEN lv_total_purchase < 100
		THEN lv_rating := 'Low';
	WHEN lv_total_purchase BETWEEN 100 and 199
		THEN lv_rating := 'Mid';
	WHEN lv_total_purchase >= 200
		THEN lv_rating := 'High';
END CASE;
	DBMS_OUTPUT.PUT_LINE('Rating = '||lv_rating);
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 2-5: Using hot variables
prompt Using $44 for the value of the bind(session) variable to generate Low
VARIABLE total_purchase1 NUMBER
BEGIN
	:total_purchase1 := 44;
END;
/
DECLARE 
	lv_rating VARCHAR2(5);
BEGIN
	IF :total_purchase1 < 100
		THEN lv_rating := 'Low';
	ELSIF :total_purchase1 BETWEEN 101 AND 199
		THEN lv_rating := 'Mid';
	ELSIF :total_purchase1 >= 200
		THEN lv_rating := 'High';
	END IF;
	DBMS_OUTPUT.PUT_LINE('Rating = '||lv_rating);
END;
/
prompt Using $144 for bind variable to generate Mid
BEGIN
	:total_purchase1 := 144;
END;
/
DECLARE 
	lv_rating VARCHAR2(5);
BEGIN
	IF :total_purchase1 < 100
		THEN lv_rating := 'Low';
	ELSIF :total_purchase1 BETWEEN 101 AND 199
		THEN lv_rating := 'Mid';
	ELSIF :total_purchase1 >= 200
		THEN lv_rating := 'High';
	END IF;
	DBMS_OUTPUT.PUT_LINE('Rating = '||lv_rating);
END;
/
prompt Using $244 for bind variable to generate High
BEGIN
	:total_purchase1 := 244;
END;
/
DECLARE 
	lv_rating VARCHAR2(5);
BEGIN
	IF :total_purchase1 < 100
		THEN lv_rating := 'Low';
	ELSIF :total_purchase1 BETWEEN 101 AND 199
		THEN lv_rating := 'Mid';
	ELSIF :total_purchase1 >= 200
		THEN lv_rating := 'High';
	END IF;
	DBMS_OUTPUT.PUT_LINE('Rating = '||lv_rating);
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 2-6: Using looping statements
DECLARE
	lv_price_amount	NUMBER(5,2) := 6;
	lv_total_available NUMBER(6,2) := 100;
	lv_total_items	NUMBER(2) := 0;
	lv_total_spent	NUMBER(6,2);
BEGIN
	WHILE lv_total_available >= lv_price_amount
		LOOP
	lv_total_items := lv_total_items + 1;
	lv_total_available := lv_total_available - lv_price_amount;
	END LOOP;
	lv_total_spent := lv_total_items * lv_price_amount;
	DBMS_OUTPUT.PUT_LINE('Items Purchased '||lv_total_items);
	DBMS_OUTPUT.PUT_LINE('Total Spent $'||lv_total_spent);
END;
/
prompt ****************************************
prompt ****************************************
spool off
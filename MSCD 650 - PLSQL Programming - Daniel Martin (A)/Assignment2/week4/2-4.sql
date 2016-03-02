spool c:\2-4.txt
prompt Bryan Mack
prompt Assignment 2 - Week 4
prompt Chapter 6 Hands-On Assigments
SET LINESIZE 200
SET SERVEROUTPUT ON
prompt ****************************************
prompt ****************************************
prompt Assignment 6-1: Formatting numbers as currency
prompt ****************************************
prompt ****************************************
prompt 6-1:1 open sql plus - ok
prompt 6-1:2 create a function using the below code
CREATE OR REPLACE FUNCTION dollar_fmt_sf
	(p_num NUMBER)
	RETURN VARCHAR2
IS
	lv_amt_txt VARCHAR2(20);
BEGIN
lv_amt_txt := TO_CHAR(p_num, '$99,999.99');
	RETURN lv_amt_txt;
END;
/
prompt 6-1:3 set serveroutput on - it already is
prompt 6-1:4 test function
DECLARE
	lv_amt_num NUMBER(8,2) := 9999.55;
BEGIN
DBMS_OUTPUT.PUT_LINE(dollar_fmt_sf(lv_amt_num));
END;
/
prompt 6-1:5 test again a different way
SELECT dollar_fmt_sf(shipping), dollar_fmt_sf(total)
FROM bb_basket
WHERE idbasket = 3;
prompt ****************************************
prompt ****************************************
prompt Assignment 6-2: Calculating total shopper spending
prompt ****************************************
prompt ****************************************
prompt 6-2:1 open sql plus
prompt 6-2:2 develop the tot_purch_sf function
CREATE OR REPLACE FUNCTION tot_purch_sf
	(shopper_id IN NUMBER)
	RETURN NUMBER
IS
total_purchased	NUMBER(7,2);
BEGIN
SELECT SUM(total) INTO total_purchased
 FROM bb_basket
WHERE shopper_id = idshopper;
RETURN total_purchased;
END;
/
prompt 6-2:3 test the function
SELECT s.idshopper, 
       s.firstname||' '||s.lastname,
       to_char(tot_purch_sf(s.idshopper),'$99,999.99')
FROM   bb_shopper	s
GROUP BY s.idshopper, s.firstname||' '||s.lastname;
prompt ****************************************
prompt ****************************************
prompt Assignment 6-3: Calculating the count of orders by a shopper
prompt ****************************************
prompt ****************************************
prompt 6-3:1 open sql plus
prompt 6-3:2 create the function
CREATE OR REPLACE FUNCTION num_purch_sf
	(shopper_id	IN NUMBER)
	RETURN NUMBER
IS
	total_purchases NUMBER(2);
BEGIN
SELECT SUM(orderplaced)
INTO total_purchases
FROM bb_basket
WHERE shopper_id = idshopper;
RETURN total_purchases;
END;
/
prompt Test the function
SELECT idshopper, num_purch_sf(idshopper)
FROM bb_shopper
WHERE idshopper = 23;
prompt ****************************************
prompt ****************************************
prompt Assignment 6-4: Identifying the day of the week for the order date
prompt ****************************************
prompt ****************************************
prompt 6-4:1 open sql plus
prompt 6-4:2 Write the function day_ord_sf
CREATE OR REPLACE FUNCTION day_ord_sf
	(date_created IN DATE)
	RETURN VARCHAR2
IS
	day_of_week VARCHAR2(9);
BEGIN
	day_of_week := TO_CHAR(date_created, 'DAY');
	RETURN day_of_week;
END;
/
prompt 6-4:3 create select statement that tests for each basket
column day_ord_sf(dtcreated) format a20
SELECT idbasket, day_ord_sf(dtcreated)
FROM bb_basket;
prompt 6-4:3 test using group_by to see what is most popular day
SELECT day_ord_sf(bb1.dtcreated), count(day_ord_sf(bb1.dtcreated)) 
FROM bb_basket	bb1
GROUP BY day_ord_sf(bb1.dtcreated);
prompt ****************************************
prompt ****************************************
prompt Assignment 6-5: Calculating days between ordering and shipping
prompt ****************************************
prompt ****************************************
CREATE OR REPLACE FUNCTION ord_ship_sf
	(basket_id  IN NUMBER)
	RETURN VARCHAR2
IS
	ok_or_check	VARCHAR2(5);
	created		DATE;
	shipped		DATE;
BEGIN
	SELECT b.dtcreated, bs.dtstage
	INTO created, shipped
	FROM bb_basket b, bb_basketstatus bs
	WHERE b.idbasket = bs.idbasket
          AND basket_id  = bs.idbasket
	  AND bs.idstage = 5;
IF to_char(shipped-created) > 1 THEN ok_or_check := 'CHECK';
ELSIF to_char(shipped-created) <= 1 THEN ok_or_check := 'OK';
END IF;
RETURN ok_or_check;
END;
/
prompt test your assignment 6-5 function
select bs.idbasket, bs.idstage, bs.dtstage, b.dtcreated
from bb_basket b, bb_basketstatus bs
where b.idbasket = bs.idbasket;
prompt this shows that basket number 3 with a stage 5 should be checked, let's try it out
DECLARE
	test_basket NUMBER(1);
BEGIN
 test_basket := 3;
 dbms_output.put_line(ord_ship_sf(test_basket));
END;
/
prompt SIDE NOTE: I AM FUMING MAD RIGHT NOW BECAUSe THE $*($#*(^ ROYALS JUST BLEW A 5 RUN LEAD IN THE 9TH INNING FOR THEIR 10TH STRAIGHt LOSS!!!
prompt ****************************************
prompt ****************************************
prompt Assignment 6-6 Identifying the description of an order status cod
prompt ****************************************
prompt ****************************************
CREATE OR REPLACE FUNCTION status_desc_sf
	(stageid	IN	NUMBER)
	RETURN VARCHAR2
IS
	stage_desc	VARCHAR2(30);
BEGIN
	IF stageid = 1 THEN stage_desc := 'Order Submitted';
	ELSIF stageid = 2 THEN stage_desc := 'Accepted, Sent to Shipping';
	ELSIF stageid = 3 THEN stage_desc := 'Backordered';
	ELSIF stageid = 4 THEN stage_desc := 'Cancelled';
	ELSIF stageid = 5 THEN stage_desc := 'Shipped';
	END IF;
	RETURN stage_desc;
END;
/
prompt Test the function for basketid 4
SELECT dtstage, status_desc_sf(idstage)
  FROM bb_basketstatus
 WHERE idbasket = 4;
prompt ****************************************
prompt ****************************************
spool off
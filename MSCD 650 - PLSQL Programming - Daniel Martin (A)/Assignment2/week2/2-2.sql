spool c:\2-2.txt
prompt Bryan Mack
prompt Assignment 2 - Week 2
prompt Chapters 3 and 4 Hands-On Assigments
SET LINESIZE 200
prompt ****************************************
prompt ****************************************
prompt Assignment 3-1 Querying data in a block
prompt ****************************************
prompt ****************************************
prompt 3-1:1  Open SQL Plus - ok
prompt 3-1:2
SET SERVEROUTPUT ON
prompt 3-1:3 Create and initialize host variable
VARIABLE g_basket NUMBER
BEGIN
	:g_basket := 3;
END;
/
prompt 3-1:4  Find the file assignment03-01.txt
prompt 3-1:5  Review the code
prompt 3-1:6 Paste code into SQL Plus
DECLARE
  lv_ship_date bb_basketstatus.dtstage%TYPE;
  lv_shipper_txt bb_basketstatus.shipper%TYPE;
  lv_ship_num bb_basketstatus.shippingnum%TYPE;
BEGIN
  SELECT dtstage, shipper, shippingnum
   INTO lv_ship_date, lv_shipper_txt, lv_ship_num
   FROM bb_basketstatus
   WHERE idbasket = :g_basket
    AND idstage = 5;
  DBMS_OUTPUT.PUT_LINE('Date Shipped: '||lv_ship_date);
  DBMS_OUTPUT.PUT_LINE('Shipper: '||lv_shipper_txt);
  DBMS_OUTPUT.PUT_LINE('Shipping #: '||lv_ship_num);
END;
/
prompt 3-1:7  Change the :g_basket variable to 7
BEGIN
	:g_basket :=7;
END;
/
prompt 3-1:8  Re-execute the code from 3-1:6
prompt This is supposed to generate an error
DECLARE
  lv_ship_date bb_basketstatus.dtstage%TYPE;
  lv_shipper_txt bb_basketstatus.shipper%TYPE;
  lv_ship_num bb_basketstatus.shippingnum%TYPE;
BEGIN
  SELECT dtstage, shipper, shippingnum
   INTO lv_ship_date, lv_shipper_txt, lv_ship_num
   FROM bb_basketstatus
   WHERE idbasket = :g_basket
    AND idstage = 5;
  DBMS_OUTPUT.PUT_LINE('Date Shipped: '||lv_ship_date);
  DBMS_OUTPUT.PUT_LINE('Shipper: '||lv_shipper_txt);
  DBMS_OUTPUT.PUT_LINE('Shipping #: '||lv_ship_num);
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 3-2  Using a record variable
prompt ****************************************
prompt ****************************************
prompt 3-2:1 open sql plus - ok
prompt 3-2:2 set serveroutput on -- already is on
prompt 3-2:3 make variable g_basket
VARIABLE g_basket NUMBER
BEGIN
	:g_basket :=3;
END;
/
prompt 3-2:4 find assignment 03-02.txt - ok
prompt 3-2:5 review the file - ok
prompt 3-2:6 paste code
DECLARE
  rec_ship bb_basketstatus%ROWTYPE;
BEGIN
  SELECT *
   INTO rec_ship
   FROM bb_basketstatus
   WHERE idbasket = :g_basket
    AND idstage = 5;
  DBMS_OUTPUT.PUT_LINE('Date Shipped: '||rec_ship.dtstage);
  DBMS_OUTPUT.PUT_LINE('Shipper: '||rec_ship.shipper);
  DBMS_OUTPUT.PUT_LINE('Shipping #: '||rec_ship.shippingnum);
  DBMS_OUTPUT.PUT_LINE('Notes: '||rec_ship.notes);
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 3-3 Processing database data with IF statements
prompt ****************************************
prompt ****************************************
prompt 3-3:1 Open SQL Plus - ok
prompt 3-3:2 set server output on - already is
prompt 3-3:3 create host variable g_shopper
VARIABLE g_shopper NUMBER
BEGIN
	:g_shopper := 22;
END;
/
prompt 3-3:4 file/open
prompt 3-3:5 find assignmetn03-03.txt, review, and edit it
prompt 3-3:6 Copy and paste code
DECLARE
 lv_total_num NUMBER(6,2);
 lv_rating_txt VARCHAR2(4);
BEGIN
 SELECT SUM(total)
  INTO lv_total_num
  FROM bb_basket
  WHERE idShopper = :g_shopper
    AND orderplaced = 1
  GROUP BY idshopper;
  IF lv_total_num > 200 THEN lv_rating_txt := 'HIGH';
  ELSIF lv_total_num BETWEEN 100 AND 199 THEN lv_rating_txt := 'MID';
  ELSIF lv_total_num < 100 THEN lv_rating_txt := 'LOW';
  END IF; 
   DBMS_OUTPUT.PUT_LINE('Shopper '||:g_shopper||' is rated '||lv_rating_txt);
END;
/
prompt 3-3:7 verify that shopper has total over $200
SELECT sum(total)
FROM bb_basket
WHERE idshopper = 22
and orderplaced = 1
GROUP BY idshopper;
prompt 3-3:8 Test other shoppers that have a completed order
prompt Will try shopper 23 first
BEGIN
	:g_shopper := 23;
END;
/
prompt Now that it is set to shopper 23, I will re-run the code
DECLARE
 lv_total_num NUMBER(6,2);
 lv_rating_txt VARCHAR2(4);
BEGIN
 SELECT SUM(total)
  INTO lv_total_num
  FROM bb_basket
  WHERE idShopper = :g_shopper
    AND orderplaced = 1
  GROUP BY idshopper;
  IF lv_total_num > 200 THEN lv_rating_txt := 'HIGH';
  ELSIF lv_total_num BETWEEN 100 AND 199 THEN lv_rating_txt := 'MID';
  ELSIF lv_total_num < 100 THEN lv_rating_txt := 'LOW';
  END IF; 
   DBMS_OUTPUT.PUT_LINE('Shopper '||:g_shopper||' is rated '||lv_rating_txt);
END;
/
prompt Now I will try shopper 24
BEGIN
	:g_shopper := 24;
END;
/
prompt re-run the code
DECLARE
 lv_total_num NUMBER(6,2);
 lv_rating_txt VARCHAR2(4);
BEGIN
 SELECT SUM(total)
  INTO lv_total_num
  FROM bb_basket
  WHERE idShopper = :g_shopper
    AND orderplaced = 1
  GROUP BY idshopper;
  IF lv_total_num > 200 THEN lv_rating_txt := 'HIGH';
  ELSIF lv_total_num BETWEEN 100 AND 199 THEN lv_rating_txt := 'MID';
  ELSIF lv_total_num < 100 THEN lv_rating_txt := 'LOW';
  END IF; 
   DBMS_OUTPUT.PUT_LINE('Shopper '||:g_shopper||' is rated '||lv_rating_txt);
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 3-4 Using searched CASE statements
prompt ****************************************
prompt ****************************************
prompt 3-4:1 open SQL Plus - ok
prompt 3-4:2 set serveroutput on - already is
prompt 3-4:3 create host variable g_shopper, initialze to 22
VARIABLE g_shopper NUMBER
BEGIN
	:g_shopper := 22;
END;
/
prompt 3-4:4 change code from 3-3:6 to use a CASE statement
prompt 3-4:5 Execute this code
DECLARE
 lv_total_num NUMBER(6,2);
 lv_rating_txt VARCHAR2(4);
BEGIN
 SELECT SUM(total)
  INTO lv_total_num
  FROM bb_basket
  WHERE idShopper = :g_shopper
    AND orderplaced = 1
  GROUP BY idshopper;
	CASE 
	WHEN lv_total_num > 200 THEN lv_rating_txt := 'HIGH';  
	WHEN lv_total_num BETWEEN 100 AND 199 THEN lv_rating_txt := 'MID';
	WHEN lv_total_num < 100 THEN lv_rating_txt := 'LOW';
	END CASE;
   DBMS_OUTPUT.PUT_LINE('Shopper '||:g_shopper||' is rated '||lv_rating_txt);
END;
/
prompt 3-4:6 verify the results
SELECT sum(total)
FROM bb_basket
WHERE idshopper = 22
and orderplaced = 1
GROUP BY idshopper;
prompt 3-4:7 Test other shoppers
prompt will test shopper 21
BEGIN
	:g_shopper := 21;
END;
/
DECLARE
 lv_total_num NUMBER(6,2);
 lv_rating_txt VARCHAR2(4);
BEGIN
 SELECT SUM(total)
  INTO lv_total_num
  FROM bb_basket
  WHERE idShopper = :g_shopper
    AND orderplaced = 1
  GROUP BY idshopper;
	CASE 
	WHEN lv_total_num > 200 THEN lv_rating_txt := 'HIGH';  
	WHEN lv_total_num BETWEEN 100 AND 199 THEN lv_rating_txt := 'MID';
	WHEN lv_total_num < 100 THEN lv_rating_txt := 'LOW';
	END CASE;
   DBMS_OUTPUT.PUT_LINE('Shopper '||:g_shopper||' is rated '||lv_rating_txt);
END;
/
prompt Now I'll test shopper 23
BEGIN
	:g_shopper := 23;
END;
/
DECLARE
 lv_total_num NUMBER(6,2);
 lv_rating_txt VARCHAR2(4);
BEGIN
 SELECT SUM(total)
  INTO lv_total_num
  FROM bb_basket
  WHERE idShopper = :g_shopper
    AND orderplaced = 1
  GROUP BY idshopper;
	CASE 
	WHEN lv_total_num > 200 THEN lv_rating_txt := 'HIGH';  
	WHEN lv_total_num BETWEEN 100 AND 199 THEN lv_rating_txt := 'MID';
	WHEN lv_total_num < 100 THEN lv_rating_txt := 'LOW';
	END CASE;
   DBMS_OUTPUT.PUT_LINE('Shopper '||:g_shopper||' is rated '||lv_rating_txt);
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 3-5: Using a WHILE loop
prompt ****************************************
prompt ****************************************
VARIABLE spending_amount NUMBER
VARIABLE product_id NUMBER
BEGIN
	:spending_amount := 100;
	:product_id	 := 4;
END;
/
DECLARE
	quantity	NUMBER(2) := 0;
	product_price	NUMBER(6,2);
BEGIN
	SELECT price
	INTO product_price
	FROM bb_product
	WHERE idproduct = :product_id;
		WHILE :spending_amount >= product_price
		LOOP
		quantity := quantity + 1;
		:spending_amount := :spending_amount - product_price;
		END LOOP;
	dbms_output.put_line('Total Quantity You Can Buy = '||quantity);
END;
/
prompt I will try it with product id of 6 (price $10) and $200 to spend
VARIABLE spending_amount NUMBER
VARIABLE product_id NUMBER
BEGIN
	:spending_amount := 200;
	:product_id	 := 6;
END;
/
DECLARE
	quantity	NUMBER(2) := 0;
	product_price	NUMBER(6,2);
BEGIN
	SELECT price
	INTO product_price
	FROM bb_product
	WHERE idproduct = :product_id;
		WHILE :spending_amount >= product_price
		LOOP
		quantity := quantity + 1;
		:spending_amount := :spending_amount - product_price;
		END LOOP;
	dbms_output.put_line('Total Quantity You Can Buy = '||quantity);
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 3-6: Working with IF statements
prompt ****************************************
prompt ****************************************
prompt Test for Basket 5
VARIABLE basket NUMBER
VARIABLE quantity NUMBER
BEGIN
	:basket := 5;
END;
/
DECLARE
	shipping_price	NUMBER(4,2);
BEGIN
	SELECT quantity
	INTO :quantity
	FROM bb_basket
	WHERE idbasket = :basket;
		IF :quantity <= 3 THEN shipping_price := 3.00;
		ELSIF :quantity BETWEEN 4 AND 6 THEN shipping_price := 7.50;
		ELSIF :quantity BETWEEN 7 AND 10 THEN shipping_price := 10.00;
		ELSIF :quantity > 10 THEN shipping_price := 12.00;
		END IF;
	dbms_output.put_line('Total Shipping Cost = $'||shipping_price);
END;
/
prompt Test for Basket 12
VARIABLE basket NUMBER
VARIABLE quantity NUMBER
BEGIN
	:basket := 12;
END;
/
DECLARE
	shipping_price	NUMBER(4,2);
BEGIN
	SELECT quantity
	INTO :quantity
	FROM bb_basket
	WHERE idbasket = :basket;
		IF :quantity <= 3 THEN shipping_price := 3.00;
		ELSIF :quantity BETWEEN 4 AND 6 THEN shipping_price := 7.50;
		ELSIF :quantity BETWEEN 7 AND 10 THEN shipping_price := 10.00;
		ELSIF :quantity > 10 THEN shipping_price := 12.00;
		END IF;
	dbms_output.put_line('Total Shipping Cost = $'||shipping_price);
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 4-1 Using an explicit cursor 
prompt ****************************************
prompt ****************************************
prompt 4-1:1 open sql plus - ok
prompt 4-1:2 set serveroutput on - already is
prompt 4-1:3 create a host variable
VARIABLE g_basket NUMBER
BEGIN
	:g_basket := 6;
END;
/
prompt 4-1:4 find the assignment04-01.txt file
prompt 4-1:5 review the file
prompt 4-1:6 paste file into sql plus
DECLARE
   CURSOR cur_basket IS
     SELECT bi.idBasket, bi.quantity, p.stock
       FROM bb_basketitem bi INNER JOIN bb_product p
         USING (idProduct)
       WHERE bi.idBasket = :g_basket;
   TYPE type_basket IS RECORD (
     basket bb_basketitem.idBasket%TYPE,
     qty bb_basketitem.quantity%TYPE,
     stock bb_product.stock%TYPE);
   rec_basket type_basket;
   lv_flag_txt CHAR(1) := 'Y';
BEGIN
   OPEN cur_basket;
   LOOP 
     FETCH cur_basket INTO rec_basket;
      EXIT WHEN cur_basket%NOTFOUND;
      IF rec_basket.stock < rec_basket.qty THEN lv_flag_txt := 'N'; END IF;
   END LOOP;
   CLOSE cur_basket;
   IF lv_flag_txt = 'Y' THEN DBMS_OUTPUT.PUT_LINE('All items in stock!'); END IF;
   IF lv_flag_txt = 'N' THEN DBMS_OUTPUT.PUT_LINE('All items NOT in stock!'); END IF;   
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 4-2 Using a CURSOR FOR loop 
prompt ****************************************
prompt ****************************************
prompt 4-2:1 open sql plus
prompt 4-2:2 find assignmente04-02.txt
prompt 4-2:3 open and review
prompt 4-2:4 paste into sql plus
DECLARE
   CURSOR cur_shopper IS
     SELECT a.idShopper, a.promo,  b.total                          
       FROM bb_shopper a, (SELECT b.idShopper, SUM(bi.quantity*bi.price) total
                            FROM bb_basketitem bi, bb_basket b
                            WHERE bi.idBasket = b.idBasket
                            GROUP BY idShopper) b
        WHERE a.idShopper = b.idShopper
     FOR UPDATE OF a.idShopper NOWAIT;
   lv_promo_txt CHAR(1);
BEGIN
  FOR rec_shopper IN cur_shopper LOOP
   lv_promo_txt := 'X';
   IF rec_shopper.total > 100 THEN 
          lv_promo_txt := 'A';
   END IF;
   IF rec_shopper.total BETWEEN 50 AND 99 THEN 
          lv_promo_txt := 'B';
   END IF;   
   IF lv_promo_txt <> 'X' THEN
     UPDATE bb_shopper
      SET promo = lv_promo_txt
      WHERE CURRENT OF cur_shopper;
   END IF;
  END LOOP;
  COMMIT;
END;
/
prompt 4-2:5 Check results with a query
SELECT s.idShopper, s.promo, SUM(bi.quantity*bi.price)
  FROM bb_shopper s, bb_basket b, bb_basketitem bi
 WHERE s.idShopper = b.idShopper
   AND b.idBasket = bi.idBasket
GROUP BY s.idShopper, s.promo
ORDER BY s.idShopper;
prompt ****************************************
prompt ****************************************
prompt Assignment 4-3 Using Implicit Cursors
prompt ****************************************
prompt ****************************************
UPDATE bb_shopper
  SET promo = NULL;
UPDATE bb_shopper
  SET promo = 'B'
  WHERE idShopper IN (21,23,25);
UPDATE bb_shopper
  SET promo = 'A'
  WHERE idShopper = 22;
COMMIT;
BEGIN
 UPDATE bb_shopper
  SET promo = NULL
  WHERE promo IS NOT NULL;
  DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 4-4 Using Exception Handling
prompt ****************************************
prompt ****************************************
prompt 4-4:1 open sql plus - ok
prompt 4-4:2 set serveroutput on - already is
prompt 4-4:3 create host variable
VARIABLE g_state CHAR(2)
BEGIN
	:g_state := 'NJ';
END;
/
prompt 4-4:4 open and review assignment04-04.txt
prompt 4-4:5 copy and paste into sql plus - should create an erro
DECLARE
  lv_tax_num NUMBER(2,2);
BEGIN
 CASE :g_state
  WHEN 'VA' THEN lv_tax_num := .04;
  WHEN 'NC' THEN lv_tax_num := .02;  
  WHEN 'NY' THEN lv_tax_num := .06;  
 END CASE;
 DBMS_OUTPUT.PUT_LINE('tax rate = '||lv_tax_num);
END;
/
prompt 4-4:6 Review this block and the next block with the exception case
prompt 4-4:7 paste the second block into sql plus
DECLARE
  lv_tax_num NUMBER(2,2);
BEGIN
 CASE :g_state
  WHEN 'VA' THEN lv_tax_num := .04;
  WHEN 'NC' THEN lv_tax_num := .02;  
  WHEN 'NY' THEN lv_tax_num := .06;  
 END CASE;
 DBMS_OUTPUT.PUT_LINE('tax rate = '||lv_tax_num);
 EXCEPTION
  WHEN CASE_NOT_FOUND THEN
   DBMS_OUTPUT.PUT_LINE('No tax');
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 4-5 Performing exception handling of predefined errors
prompt ****************************************
prompt ****************************************
VARIABLE g_shopper NUMBER
BEGIN
	:g_shopper := 99;
END;
/
DECLARE
 rec_shopper bb_shopper%ROWTYPE;
BEGIN
 SELECT *
  INTO rec_shopper
  FROM bb_shopper
  WHERE idShopper = :g_shopper;
EXCEPTION
 WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Invalid Shopper ID');
END;
/
prompt ****************************************
prompt ****************************************
prompt Assignment 4-6 Performing exception handling of non-predefined errors
prompt ****************************************
prompt ****************************************
ALTER TABLE bb_basketitem
  ADD CONSTRAINT bitems_qty_ck CHECK (quantity < 20);
DECLARE
	basketitem_check EXCEPTION;
	PRAGMA EXCEPTION_INIT(basketitem_check, -2290);
BEGIN
  INSERT INTO bb_basketitem 
   VALUES (88,8,10.8,21,16,2,3);
EXCEPTION
	WHEN basketitem_check THEN
	DBMS_OUTPUT.PUT_LINE('You cannot have more than 20 items, fool!');
END;
/
prompt ****************************************
prompt ****************************************
spool off
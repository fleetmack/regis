spool c:\2-3.txt
prompt Bryan Mack
prompt Assignment 2 - Week 3
prompt Chapter 5 Hands-On Assigments
SET LINESIZE 200
SET SERVEROUTPUT ON
prompt ****************************************
prompt ****************************************
prompt Assignment 5-1 Creating a Procedure
prompt ****************************************
prompt ****************************************
prompt 5-1:1 open sql plus - ok
prompt 5-1:2 create the procedure
prompt 5-1:3 run the code
CREATE OR REPLACE PROCEDURE prod_name_sp
	(p_prodid IN bb_product.idproduct%TYPE,
	 p_descrip IN bb_product.description%TYPE)
	IS
	BEGIN
		UPDATE bb_product
		   SET description = p_descrip
		 WHERE idproduct = p_prodid;
		COMMIT;
	END;
/
prompt 5-1:4 Invoke the Procedure
EXECUTE prod_name_sp(1,'CapressoBar Model #388');
prompt 5-1:5 check if it worked
SELECT * FROM bb_product;
prompt ****************************************
prompt ****************************************
prompt Assignment 5-2 Using a procedure with IN parameters
prompt ****************************************
prompt ****************************************
prompt 5-2:1 open sqql plus - it is
prompt 5-2:2 create a procedure named PROD_ADD_SP
prompt 5-2:3 Run code to create procedure
CREATE OR REPLACE PROCEDURE prod_add_sp
	(prod_name	IN	VARCHAR2,
	description	IN	VARCHAR2,
	image_file_name IN	VARCHAR2,
	price		IN	NUMBER,
	active_status	IN	NUMBER)
IS
	BEGIN
	INSERT INTO bb_product (idproduct, productname, description, productimage, price, active)
	VALUES (bb_prodid_seq.nextval, prod_name, description, image_file_name, price, active_status);
	END;
/
prompt 5-2:4 insert values, aka, execute the procedure
EXECUTE prod_add_sp('Roasted Blend','Well-balanced mix of roasted beans, a medium body','roasted.jpg',9.50,1);
EXECUTE prod_add_sp('Roasted Blend2','Well-balanced mix of roasted beans, a medium body2','roasted2.jpg',9.50,1);
prompt 5-2:5 query the table to show that the procedure executed and inserted the values properly
SELECT * FROM bb_product;
prompt ****************************************
prompt ****************************************
prompt Assignment 5-3 Calculating the tax on an order
prompt ****************************************
prompt ****************************************
prompt 5-3:1 open sql plus - already did that there, hoss
prompt 5-3:3 create host variable
VARIABLE g_tax NUMBER;
prompt 5-3:2 Create procedure tax_cost_sp
CREATE OR REPLACE PROCEDURE tax_cost_sp
	(state IN	VARCHAR2,
	 subtotal IN	NUMBER,
	tax	OUT	NUMBER)
IS
	BEGIN
	IF state = 'VA' THEN tax := (subtotal * .045);
	ELSIF state = 'NC' THEN tax := (subtotal * .03);
	ELSIF state = 'SC' THEN tax := (subtotal * .06);
	END IF;
	END;
/
prompt 5-3:4 invoke procedure using $100 and VA
EXECUTE tax_cost_sp('VA',100, :g_tax);
prompt 5-4:5 display the tax amount
PRINT g_tax;
prompt ****************************************
prompt ****************************************
prompt Assignment 5-4 Updating columns in table
prompt ****************************************
prompt ****************************************
prompt 5-4:1 open sql plus ... ok
prompt 5-4:2 create basket_confirm_sp
CREATE OR REPLACE PROCEDURE basket_confirm_sp
	(i_basketid	IN	NUMBER,
	i_subtotal	IN 	NUMBER,
	i_shipping	IN 	NUMBER,
	i_tax		IN 	NUMBER,
	i_total		IN 	NUMBER)
IS
BEGIN
	UPDATE bb_basket
           SET orderplaced = 1,
	       subtotal = i_subtotal,
	       shipping = i_shipping,
	       tax = i_tax,
	       total = i_total
         WHERE idbasket = i_basketid;
END;
/
prompt 5-4:3 insert initial values into bb_basket
INSERT INTO bb_basket (idbasket, quantity, idshopper, orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
VALUES (17,2,22,0,0,0,0,0,'28-FEB-07',0);

INSERT INTO bb_basketitem (idbasketitem, idproduct, price, quantity, idbasket, option1, option2)
VALUES(44,7,10.8,3,17,2,3);

INSERT INTO bb_basketitem (idbasketitem, idproduct, price, quantity, idbasket, option1, option2)
VALUES(45,8,10.8,3,17,2,3);
prompt 5-4:4 execute the procedure
EXECUTE basket_confirm_sp(17,64.80, 8.00, 1.94, 74.74);
prompt 5-4:5 see if the insert worked
SELECT subtotal, shipping, tax, total, orderplaced 
FROM bb_basket
WHERE idbasket = 17;
prompt ****************************************
prompt ****************************************
prompt Assignment 5-5 Updating the status of an order
prompt ****************************************
prompt ****************************************
CREATE OR REPLACE PROCEDURE status_ship_sp
	(i_basketid	IN	NUMBER,
	i_date_shipped  IN	DATE,
	i_shipper	IN	VARCHAR2,
	i_tracking_num	IN	VARCHAR2)
IS
	BEGIN
	INSERT INTO bb_basketstatus (idstatus, idbasket, idstage, dtstage, shipper, shippingnum)
	VALUES (bb_status_seq.nextval, i_basketid, 3, i_date_shipped, i_shipper, i_tracking_num);
	END;
/
EXECUTE status_ship_sp(3,'20-FEB-07','UPS','ZW2384YXK4957');
prompt ****************************************
prompt ****************************************
prompt Assignment 5-6 Returning order status information
prompt ****************************************
prompt ****************************************
VARIABLE date_proc VARCHAR2(15);
VARIABLE status	VARCHAR2(30);
CREATE OR REPLACE PROCEDURE status_sp
	(i_basketid	IN	NUMBER,
	 o_status	OUT	VARCHAR2,
	 o_date		OUT	VARCHAR2)
IS
BEGIN
	SELECT bb1.idstage, to_char(bb1.dtstage,'MM-DD-YYYY')
	INTO o_status,o_date
	FROM bb_basketstatus	bb1
	WHERE i_basketid = bb1.idbasket
	  AND bb1.dtstage =
		(SELECT max(dtstage)
	           FROM bb_basketstatus	bb2
		  WHERE bb1.idbasket = bb2.idbasket);
	CASE 
	WHEN o_status = '1' THEN o_status := 'Submitted and received';
	WHEN o_status = '2' THEN o_status := 'Confirmed, processed, sent to shipping';
	WHEN o_status = '3' THEN o_status := 'Shipped';
	WHEN o_status = '4' THEN o_status := 'Cancelled';
	WHEN o_status = '5' THEN o_status := 'Backordered';
	END CASE;
DBMS_OUTPUT.PUT_LINE('Status: '||o_status);
DBMS_OUTPUT.PUT_LINE('Status Date: '||o_date);
EXCEPTION WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('No status available');
END;
/
EXECUTE  status_sp(4,:status, :date_proc);
EXECUTE status_sp(6, :status, :date_proc);
prompt ****************************************
prompt ****************************************
spool off
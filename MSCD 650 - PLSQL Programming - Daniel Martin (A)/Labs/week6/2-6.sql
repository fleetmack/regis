spool c:\2-6.txt
prompt Bryan Mack
prompt Assignment 2 - Week 6
prompt Chapter 6 Hands-On Assigments
SET LINESIZE 300
SET SERVEROUTPUT ON
prompt *** note: Log on as username scott for this one
@c:\c9Dbcreate.sql
prompt ****************************************
prompt ****************************************
prompt Assignment 9-1 Creating a trigger to address product restocking
prompt ****************************************
prompt ****************************************
prompt 9-1:1 try to write the code
prompt 9-1:2 open sql*plus
prompt 9-1:3 open c9reorder.sql file
prompt 9-1:4 review the code
prompt 9-1:5 run the code
CREATE OR REPLACE TRIGGER bb_reorder_trg
   AFTER UPDATE OF stock ON bb_product
   FOR EACH ROW 
DECLARE
  v_onorder_num NUMBER(4);
 BEGIN
  If :NEW.stock <= :NEW.reorder THEN
   SELECT SUM(qty)
    INTO v_onorder_num
    FROM bb_product_request
    WHERE idProduct = :NEW.idProduct
     AND dtRecd IS NULL;
   IF v_onorder_num IS NULL THEN v_onorder_num := 0; END IF;
   IF v_onorder_num = 0 THEN
     INSERT INTO bb_product_request (idRequest, idProduct, dtRequest, qty)
       VALUES (bb_prodreq_seq.NEXTVAL, :NEW.idProduct, SYSDATE, :NEW.reorder);
   END IF;
  END IF;
END;
/
prompt 9-1:6 test the data
SELECT stock, reorder
  FROM bb_product
 WHERE idproduct = 4;
prompt 9-1:7 run an update and verify the trigger performed
UPDATE bb_product
   SET stock = 25
 WHERE idproduct = 4;
SELECT *
  FROM bb_product_request;
prompt 9-1:8 rollback
rollback;
prompt 9-1:9 disable trigger for future projects
ALTER TRIGGER bb_reorder_trg DISABLE;
prompt ****************************************
prompt ****************************************
prompt Assignment 9-2 Updating stock information when a product request is filled
prompt ****************************************
prompt ****************************************
prompt 9-2:1 insert a row
INSERT INTO bb_product_request (idrequest, idproduct, dtrequest, qty) VALUES (3,5, sysdate, 45);
commit;
prompt 9-2:2 write the trigger
CREATE OR REPLACE TRIGGER bb_reqfill_trg
AFTER UPDATE OF dtrecd ON bb_product_request
FOR EACH ROW
BEGIN
   IF :OLD.dtrecd IS NULL THEN
   UPDATE bb_product
      SET stock = stock + reorder
    WHERE idproduct = :NEW.idproduct;
    END IF;
END;
/
prompt 9-2:3 query the stock and reorder data
SELECT stock, reorder
FROM bb_product
WHERE idproduct = 5;
SELECT *
FROM bb_product_request
WHERE idproduct = 5;
prompt 9-2:4 fire the trigger with an update statement
UPDATE bb_product_request
   SET dtrecd = sysdate, cost = 225
WHERE idrequest = 3;
prompt 9-2:5 query to show the trigger ran
select *
from bb_product_request
where idproduct = 5;
prompt Holy s**t do I hate being a Royals fan, really? 7 runs given up in the 7th to the RANGERS?!??!!
select stock, reorder
from bb_product
where idproduct = 5;
rollback;
prompt ****************************************
prompt ****************************************
prompt Assignment 9-3 Updating the stock level if a product fulfillment is cancelled
prompt ****************************************
prompt ****************************************
prompt 9-3:1 Fix the trigger
CREATE OR REPLACE TRIGGER bb_reqfill_trg
AFTER UPDATE OF dtrecd ON bb_product_request
FOR EACH ROW
BEGIN
   IF :OLD.dtrecd IS NULL THEN
   UPDATE bb_product
      SET stock = stock + reorder
    WHERE idproduct = :NEW.idproduct;
   ELSIF :NEW.dtrecd IS NULL THEN
   UPDATE bb_product
      SET stock = stock - reorder
     WHERE idproduct = :NEW.idproduct;
    END IF;
END;
/
prompt 9-3:2 insert test data
INSERT INTO bb_product_request (idrequest, idproduct, dtrequest, qty, dtrecd, cost)
 VALUES(4, 5, SYSDATE, 45, '15-JUN-03', 225);
UPDATE bb_product
   SET stock = 86
 WHERE idproduct = 5;
COMMIT;
prompt (no step) verify the pre-trigger-execution data
SELECT stock, reorder
FROM bb_product
WHERE idproduct = 5;
SELECT *
FROM bb_product_request
WHERE idrequest = 4;
prompt 9-3:3 fire trigger
UPDATE bb_product_request
   SET dtrecd = NULL
WHERE idrequest = 4;
prompt verify the trigger worked
SELECT stock, reorder
FROM bb_product
WHERE idproduct = 5;
SELECT *
FROM bb_product_request
WHERE idrequest = 4;
prompt 9-3:4 disable the trigger
ALTER TRIGGER bb_reqfill_trg DiSABLE;
prompt ****************************************
prompt ****************************************
prompt Assignment 9-4 Updating stock levels when an order is cancelled
prompt ****************************************
prompt ****************************************
CREATE OR REPLACE TRIGGER bb_ordcancel_trg
AFTER INSERT ON bb_basketstatus
FOR EACH ROW
WHEN (NEW.idstage = 4)
	DECLARE CURSOR mack_trg_cursor
	IS
	SELECT i.quantity, i.idbasket, i.idproduct
	  FROM bb_basketitem	i;
BEGIN
  FOR   rec_cur IN mack_trg_cursor
LOOP
	UPDATE bb_product
           SET stock = stock + rec_cur.quantity
         WHERE rec_cur.idproduct = idproduct;
	UPDATE bb_basket
 	   SET orderplaced = 0
	 WHERE rec_cur.idbasket = :NEW.idbasket;
END LOOP;
END;
/
prompt pre-test the values of basket 6 and the order for basket 6
select * from bb_basketitem where idbasket = 6;
select * from bb_basket where idbasket = 6;
select idproduct, stock from bb_product where idproduct IN (10,2);
prompt 9-4:1 use this insert to test the trigger you just created
INSERT INTO bb_basketstatus(idstatus, idbasket, idstage, dtstage)
VALUES (bb_status_seq.NEXTVAL, 6, 4, sysdate);
prompt post-test the values
select * from bb_basketitem where idbasket = 6;
select * from bb_basket where idbasket = 6;
select idproduct, stock from bb_product where idproduct IN (10,2);
prompt ****************************************
prompt ****************************************
prompt Assignment 9-5 Processing discounts
prompt ****************************************
prompt ****************************************
prompt create the trigger
CREATE OR REPLACE PACKAGE disc_pkg
IS
	pv_disc_num	NUMBER;
	pv_disc_text	CHAR(1);
END;
/
BEGIN
disc_pkg.pv_disc_num := 5;
disc_pkg.pv_disc_text := 'N';
END;
/
CREATE OR REPLACE TRIGGER bb_discount_trg
AFTER UPDATE OF orderplaced ON bb_basket
FOR EACH ROW
BEGIN
IF :NEW.orderplaced = 1 AND disc_pkg.pv_disc_num = 5 THEN
   disc_pkg.pv_disc_text := 'Y';
ELSIF :NEW.orderplaced = 0 THEN
   disc_pkg.pv_disc_text := 'N';
END IF;
END;
/
prompt show pre-trigger status
begin
dbms_output.put_line(disc_pkg.pv_disc_text);
end;
/
prompt fire the trigger
UPDATE bb_basket
   SET orderplaced = 1
 WHERE idbasket = 13;
prompt post-test the trigger by showing data
begin
dbms_output.put_line(disc_pkg.pv_disc_text);
end;
/
prompt set orderplaced back to 0 and test packaged variable
UPDATE bb_basket
   SET orderplaced = 0
 WHERE idbasket = 13;
begin
dbms_output.put_line(disc_pkg.pv_disc_text);
end;
/
prompt disable the trigger
alter trigger bb_discount_trg DISABLE;
prompt ****************************************
prompt ****************************************
prompt Assignment 9-6 Using triggers to maintain referential integrity
prompt ****************************************
prompt ****************************************
prompt create trigger
CREATE OR REPLACE TRIGGER bb_ri_trg
BEFORE UPDATE OF idproduct ON bb_product
FOR EACH ROW
BEGIN
UPDATE bb_basketitem
   SET idproduct = :NEW.idproduct
 WHERE idproduct = :OLD.idproduct;
UPDATE bb_productoption
   SET idproduct = :NEW.idproduct
 WHERE idproduct = :OLD.idproduct;
END;
/
prompt test trigger
UPDATE bb_product
   SET idproduct = 22
 WHERE idproduct = 7;
prompt rollback the data
rollback;
prompt disable the trigger
alter trigger bb_ri_trg DISABLE;
prompt ****************************************
prompt ****************************************
spool off
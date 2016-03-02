SET ECHO ON
CREATE OR REPLACE PACKAGE mutate_pkg AS
  pv_start_dat DATE;
  pv_end_dat DATE;
  pv_prod_num NUMBER;
END;
/
CREATE OR REPLACE TRIGGER sales_date_trg
  BEFORE UPDATE OF SaleStart ON bb_product
 BEGIN
  SELECT SaleStart, SaleEnd
   INTO mutate_pkg.pv_start_dat, mutate_pkg.pv_end_dat
   FROM bb_product
   WHERE idProduct = mutate_pkg.pv_prod_num;
 END;
/
CREATE OR REPLACE TRIGGER sales_trg
  BEFORE UPDATE OF SaleStart ON bb_product
  FOR EACH ROW
 BEGIN
  IF :NEW.SaleStart BETWEEN mutate_pkg.pv_start_dat AND mutate_pkg.pv_end_dat THEN
    RAISE_APPLICATION_ERROR(-20101,'Product Already on Sale!');
  END IF;
 END;
/

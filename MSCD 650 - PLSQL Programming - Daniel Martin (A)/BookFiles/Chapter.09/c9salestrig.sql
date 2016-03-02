CREATE OR REPLACE TRIGGER sales_trg
  BEFORE UPDATE OF SaleStart ON bb_product
  FOR EACH ROW
 DECLARE
  v_start_dt DATE;
  V_end_dt DATE;
 BEGIN
  SELECT SaleStart, SaleEnd
   INTO v_start_dt, v_end_dt
   FROM bb_product
   WHERE idProduct = :NEW.idProduct;
  IF :NEW.SaleStart BETWEEN v_start_dt AND v_end_dt THEN
    RAISE_APPLICATION_ERROR(-20101,'Product Already on Sale!');
  END IF;
 END;
/
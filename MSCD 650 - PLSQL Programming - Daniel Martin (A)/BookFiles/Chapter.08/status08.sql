CREATE OR REPLACE PROCEDURE ship_cost_sp
   (p_qty IN NUMBER,
    p_ship OUT NUMBER)
 IS
  lv_junk_num NUMBER(1);
BEGIN
 IF p_qty > 10 THEN
   p_ship := 11.00;
 ELSIF p_qty > 5 THEN
   p_ship := 8.00;
 ELSE
   p_ship := 5.00;
 END IF;
END;
/
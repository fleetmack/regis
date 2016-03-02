SET ECHO ON
CREATE OR REPLACE PACKAGE ordering_pkg
 IS
  pv_total_num NUMBER(3,2) :=0;
  PROCEDURE order_total_pp
    (p_bsktid IN NUMBER,
     p_cnt OUT NUMBER,
     p_sub OUT NUMBER,
     p_ship OUT NUMBER,
     p_total OUT NUMBER);
END;
/
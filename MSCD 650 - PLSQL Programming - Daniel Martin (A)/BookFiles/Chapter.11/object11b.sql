CREATE TABLE bb_order
 (ord_id NUMBER(4),
  cust_id NUMBER(4),
  ord_date DATE,
  total NUMBER(6,2),
  bill_addr addr_ot,
  ship_addr addr_ot)
/
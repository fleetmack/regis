DECLARE 
  lv_bill addr_ot;
  lv_ship addr_ot;
BEGIN
  lv_bill := addr_ot('55 Ulger Dr',NULL,'Chesapeake','VA',444668229);
  lv_ship := addr_ot('55 Ulger Dr',NULL,'Chesapeake','VA',444668229);
  INSERT INTO bb_order
     VALUES (103,38,'11-NOV-03',24.50,lv_bill,lv_ship);
END;
/
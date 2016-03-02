DECLARE
  lv_status_int INTEGER;
  lv_msg VARCHAR2(40);
  lv_last VARCHAR2(15) := 'CASTEEL';
  lv_ccnum NUMBER(12) := 1234567890;
  lv_exp VARCHAR2(5) := '09/05';
BEGIN
  lv_msg := lv_last||'-'||lv_ccnum||'-'||lv_exp;
  DBMS_PIPE.PACK_MESSAGE(lv_msg);
  lv_status_int := DBMS_PIPE.SEND_MESSAGE('Testpipe');
  IF lv_status_int <> 0 THEN
    DBMS_OUTPUT.PUT_LINE('Error');
  ENd IF;
END;
/
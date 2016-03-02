DECLARE
  lv_status_int INTEGER;
BEGIN
  DBMS_PIPE.PACK_MESSAGE(85456845574811);
  lv_status_int := DBMS_PIPE.SEND_MESSAGE('Testpipe');
  IF lv_status_int <> 0 THEN
    DBMS_OUTPUT.PUT_LINE('Error');
  ENd IF;
END;
/

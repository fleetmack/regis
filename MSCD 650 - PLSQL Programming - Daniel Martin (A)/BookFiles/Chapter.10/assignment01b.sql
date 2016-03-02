DECLARE
  lv_status_int INTEGER;
  lv_msg VARCHAR2(40);
BEGIN
  lv_status_int := DBMS_PIPE.RECEIVE_MESSAGE('Testpipe');
  IF lv_status_int <> 0 THEN
    DBMS_OUTPUT.PUT_LINE('Error');
  ENd IF;
  DBMS_PIPE.UNPACK_MESSAGE(lv_msg);
  DBMS_OUTPUT.PUT_LINE(lv_msg);
END;
/
DECLARE
  lv_status_int INTEGER;
  lv_credit_num NUMBER(15);
BEGIN
  lv_status_int := DBMS_PIPE.RECEIVE_MESSAGE('Testpipe');
  IF lv_status_int <> 0 THEN
    DBMS_OUTPUT.PUT_LINE('Error');
  ENd IF;
  DBMS_PIPE.UNPACK_MESSAGE(lv_credit_num);
  DBMS_OUTPUT.PUT_LINE(lv_credit_num);
END;
/
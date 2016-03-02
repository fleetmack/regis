CREATE OR REPLACE PROCEDURE dyn_ddl_sp
  (p_table IN VARCHAR2,
   p_col IN VARCHAR2,
   p_type IN VARCHAR2)
 IS
  lv_cursor INTEGER;
  lv_add VARCHAR2(100);
BEGIN
  lv_cursor := DBMS_SQL.OPEN_CURSOR;
  lv_add := 'ALTER TABLE '|| p_table || ' ADD ('||
              p_col || ' ' || p_type || ')';
  DBMS_SQL.PARSE(lv_cursor, lv_add, DBMS_SQL.NATIVE); 
  DBMS_SQL.CLOSE_CURSOR(lv_cursor);
END;
/
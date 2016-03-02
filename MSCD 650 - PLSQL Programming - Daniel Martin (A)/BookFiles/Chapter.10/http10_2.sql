CREATE OR REPLACE PROCEDURE read_http_sp
 (p_url VARCHAR2)
 IS
 lv_read_tbl utl_http.html_pieces;
 fh UTL_FILE.FILE_TYPE;
BEGIN
 htp.print('<BASE HREF='||p_url||'>');
 lv_read_tbl := utl_http.request_pieces(p_url);
 fh := UTL_FILE.FOPEN('ORA_FILES','test_http.htm','w');
 FOR i IN 1..lv_read_tbl.COUNT LOOP
  UTL_FILE.PUT_LINE(fh, lv_read_tbl(i));
 END LOOP;
 UTL_FILE.FCLOSE(fh);
END;
/

CREATE TYPE BODY addr_ot
  AS
   MEMBER FUNCTION lbl_print
      RETURN VARCHAR2 
  IS
   lv_lbl VARCHAR2(100);
 BEGIN
  IF street2 IS NOT NULL THEN
   lv_lbl := street1||chr(10)||
             street2||chr(10)||
             city||', '||state||' '||
               SUBSTR(zip,1,5)||'-'||SUBSTR(zip,6,4);
  ELSE
   lv_lbl := street1||chr(10)||
             city||', '||state||' '||
               SUBSTR(zip,1,5)||'-'||SUBSTR(zip,6,4);
  END IF;
  RETURN lv_lbl;
 END;
END;
/
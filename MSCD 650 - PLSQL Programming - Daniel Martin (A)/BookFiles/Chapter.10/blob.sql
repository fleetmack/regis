CREATE OR REPLACE PROCEDURE insert_image_sp
 (id IN NUMBER, 
  file_name IN VARCHAR2)
 IS
  b_lob   BLOB;  
  f_lob   BFILE;      
BEGIN  
      SELECT pimage INTO b_lob FROM bb_product WHERE idProduct = id
        FOR UPDATE;       
      f_lob  := BFILENAME( 'BB_IMAGES', file_name );  
      DBMS_LOB.fileopen(f_lob, DBMS_LOB.file_readonly);
      DBMS_LOB.loadfromfile( b_lob, f_lob, DBMS_LOB.getlength(f_lob) );  
      DBMS_LOB.fileclose(f_lob);
      COMMIT;
END;
/
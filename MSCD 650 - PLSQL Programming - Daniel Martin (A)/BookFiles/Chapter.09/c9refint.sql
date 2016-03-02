CREATE OR REPLACE TRIGGER bb_deptchg_trg
  BEFORE UPDATE OF idDepartment ON bb_department
  FOR EACH ROW
 BEGIN
   UPDATE bb_product
    SET idDepartment = :NEW.idDepartment
    WHERE idDepartment = :OLD.idDepartment;
 END;
/
SET ECHO ON
CREATE OR REPLACE PROCEDURE global_test_sp
 (p_test OUT NUMBER)
  IS
 BEGIN
  p_test := ordering_pkg.pv_total_num;
END;
/
CREATE OR REPLACE PROCEDURE global_set_sp
 (p_test IN NUMBER)
  IS
 BEGIN
  ordering_pkg.pv_total_num := p_test;
END;
/
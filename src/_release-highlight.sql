--...
-- Issue Specific DML/DDL
@issue-123.sql

-- ...
@packages/pkg_emp.pks
@packages/pkg_emp.pkb

-- ...
@views/v_dept.sql

-- ...
@data/data_emp.sql

-- Recompile Invalid Objects
exec dbms_utility.compile_schema(schema => user,  compile_all => false);

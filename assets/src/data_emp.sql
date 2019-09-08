declare
  type rec_data is varray(2) of varchar2(4000);
  type tab_data is table of rec_data index by pls_integer;
  l_data tab_data;
  l_row emp%rowtype;
  
begin
  l_data(l_data.count + 1) := rec_data('SCOTT', '100');
  -- ... More data rows

  for i in 1..l_data.count loop
    -- Define l_row
    l_row.ename := l_data(i)(1);
    l_row.sal := l_data(i)(2);

    -- Merge data
    merge into emp e
      using (
        select l_row.ename ename
        from dual
      ) src
      on (e.ename = src.ename)
    when matched then
      update set sal = l_row.sal
    when not matched then
      insert (ename, sal)
      values(l_row.ename, l_row.sal)
    ;
  end loop;
end;
/
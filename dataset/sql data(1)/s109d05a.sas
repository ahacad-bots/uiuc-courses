*** s109d05a ***;

proc sql;
   create table work.Staff as
      select * 
	     from orion.Staff;
quit;

proc sql;
   delete from work.Staff

      where Emp_Term_Date is not missing
;
quit;

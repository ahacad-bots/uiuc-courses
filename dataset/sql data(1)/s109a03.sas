*** s109a03 ***;  

proc sql;
   create table work.Staff as
      select *
	     from orion.Staff
   ;
   delete from work.Staff;
      where Emp_Term_Date
   ;
quit;

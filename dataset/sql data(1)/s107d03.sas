*** s107d03 ****;

proc sql;
   create table work.Melbourne as
      select Employee_Name as Name ,Salary
         from orion.Staff as s,
              orion.Employee_addresses as a
         where s.Employee_ID=a.Employee_ID
	           and City ="Melbourne"
;
quit;
proc contents data=work.melbourne;
run;

proc sql;
title "Melbourne Employees";
   select *
      from work.Melbourne
	  order by name
;
quit;
title;

proc sql;
   describe table Melbourne;
quit;

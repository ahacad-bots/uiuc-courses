*** s103d09 ***;

proc sql;
   select Department, count(*) as Count
      from orion.Employee_Organization
      group by Department
;
quit;

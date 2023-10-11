*** s103d11 ***;
 
proc sql;
   select Department, count(*) as Count
      from orion.Employee_Organization
	  group by Department
	  having Count ge 25
	  order by Count desc
;
quit;

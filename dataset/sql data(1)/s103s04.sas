***	s103s04 ***;

proc sql;
title "Cities Where Employees Live";
   select City, Count (*) as Count
	  from orion.Employee_Addresses
	  group by city
	  order by city
;
quit;
title;

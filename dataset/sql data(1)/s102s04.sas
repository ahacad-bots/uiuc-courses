*** s102s04 ***;

proc sql;
title 'Cities Where Employees Live';
   select distinct City
      from orion.Employee_Addresses;
quit;
title;

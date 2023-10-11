*** s103d01 ***;

proc sql;
   select Employee_ID, Salary
      from orion.Employee_Payroll
	  where Employee_Hire_Date < '01JAN1979'd 
      order by Salary desc;
quit;
title;



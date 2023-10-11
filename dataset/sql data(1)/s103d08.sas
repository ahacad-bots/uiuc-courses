*** s103d08 ***;

proc sql;
title "Average Salary by Gender";
   select Employee_Gender as Gender, 
	      avg(Salary) as Average
	  from orion.Employee_Payroll
	  where Employee_Term_Date is missing
	  group by Employee_Gender
;
quit;
title;

*** s103a02 ***;

proc sql;
   select Employee_Gender, avg(Salary) as Average
	  from orion.Employee_Payroll
	  where Employee_Term_Date is missing
	  group by Employee_Gender
;
quit;

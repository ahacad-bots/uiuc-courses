*** s103d07a ***;

options nosqlremerge ;
proc sql noremerge;
   select Employee_Gender, avg(Salary) as Average
      from orion.Employee_Payroll
	  where Employee_Term_Date is missing
;
quit;
options sqlremerge ;

proc sql noremerge;
   select Employee_Gender, avg(Salary) as Average
	  from orion.Employee_Payroll
	  where Employee_Term_Date is missing
;
quit;

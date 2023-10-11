*** s103d07 ***;

proc sql;
   select count(*) as Count
      from orion.Employee_Payroll
	  where Employee_Term_Date is missing
;
quit;

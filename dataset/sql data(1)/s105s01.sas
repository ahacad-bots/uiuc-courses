*** s105s01 ***; 

proc sql;
title "Employees With More Than 30 Years of Service";
title2 "As of December 31, 2007";
   select Employee_Name 'Employee Name', 
          int(('31DEC2007'd-Employee_Hire_Date)/365.25)
          as YOS 'Years of Service'
      from orion.Employee_Addresses as a,
           orion.Employee_Payroll as p
	  where a.Employee_ID=p.Employee_ID
	        and calculated YOS gt 30
	   order by Employee_Name
;
quit;
title;

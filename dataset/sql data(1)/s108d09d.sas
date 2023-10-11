*** s108d09d ***;
proc sql noprint;
   select Name
          into :Column_Names separated by ","
      from dictionary.Columns
      where libname ="ORION"
            and memname="EMPLOYEE_PAYROLL"
	        and upcase(Name) like '%DATE%' 
 ;
reset print;
title "Dates of Interest by Employee_ID";
   select Employee_ID, &Column_Names
      from orion.Employee_Payroll
	  order by Employee_ID
;
quit;
title;

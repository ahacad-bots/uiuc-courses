*** s108d09b ***;
proc sql noprint;
   select Name
          into :Column_Names separated by ","
      from dictionary.Columns
      where libname ="WORK"
            and memname="PAYROLL"
	        and upcase(Name) like '%DATE%' 
 ;
reset print;
title "Dates of Interest by Employee_ID";
   select Employee_ID, &Column_Names
      from work.Payroll
	  order by Employee_ID
;
quit;
title;

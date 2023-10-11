*** s107d10 ***;
proc sql;
   create view orion.Tom_Zhou as
      select Employee_Name as Name format=$25.0, 
             Job_Title as Title format=$15.0, 
             Salary 'Annual Salary' format=comma10.2, 
             int((today()-Employee_Hire_Date)/365.25)
              as YOS 'Years of Service'
         from orion.Employee_addresses as a,
              orion.Employee_payroll as p,
              orion.Employee_organization as o
         where a.Employee_ID=p.Employee_ID and
               o.Employee_ID=p.Employee_ID and
               Manager_ID=120102
;
quit;
proc sql;
title "Tom Zhou's Direct Reports";
title2 "By Title and Years of Service";
   select *
      from orion.Tom_Zhou
	  order by Title desc, YOS desc
;
title;
quit;
title "Tom Zhou's Group - Salary Statistics";
proc means data=orion.Tom_Zhou min mean max;
   var salary;
   class title;
run;
title;

proc sql;
   describe view orion.Tom_Zhou;
quit;

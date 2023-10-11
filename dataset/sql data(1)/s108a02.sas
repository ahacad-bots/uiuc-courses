*** s108a02 ***;
%let Dept=Sales;

proc sql noprint row;
   select avg(Salary) into :MeanSalary
      from orion.Employee_Payroll as p,
           orion.Employee_Organization as o
      where p.Employee_ID=O.Employee_ID
            and Department=Propcase("&Dept")
;
reset print number;
title "&Dept Department Employees Earning";
title2 "More Than The Department Average "
       "Of &meansalary";
   select p.Employee_ID, Salary
      from orion.Employee_Payroll as p,
           orion.Employee_Organization as o
      where p.Employee_ID=O.Employee_ID
            and Department=Propcase("&Dept")
            and Salary > &meansalary;
quit;
title;

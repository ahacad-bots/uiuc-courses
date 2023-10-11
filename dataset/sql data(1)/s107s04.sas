*** s107s04 ***; 
  /* a. */
proc sql;
   create table orion.Employees as
      select a.Employee_ID, 
             Employee_Hire_Date as Hire_Date 
             format=mmddyy10., 
             Salary format=comma12.2, 
             Birth_Date format=mmddyy10., 
             Employee_Gender as Gender, 
             Country, City
         from orion.Employee_addresses as a,
              orion.Employee_payroll as p
         where a.Employee_ID=p.Employee_ID
               and Employee_Term_Date is missing
         order by year(Employee_Hire_Date), salary desc
;
quit;
  /* b. */
title;
proc sql;
   select * 
      from orion.Employees
;
quit;

*** s108d09a ***; 
proc sql;
   create table Payroll as
      select Employee_ID, Employee_Gender, Salary, 
             Birth_Date format=date9.,   
             Employee_Hire_Date as Hire_Date format=date9.,   
             Employee_Term_Date as Term_Date format=date9.   
         from orion.Employee_Payroll
         order by Employee_ID
;
quit;

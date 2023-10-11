*** s103s01 ***;

proc sql; 
title "Single Male Employee Salaries";
   select Employee_ID, 
          Salary format=comma10.2, 
          Salary/3 format=comma9.2 as Tax
      from orion.Employee_Payroll
      where Marital_Status="S"
        and Employee_Gender ="M" 
        and Employee_Term_Date is missing
     order by Salary desc
;
quit;
title;

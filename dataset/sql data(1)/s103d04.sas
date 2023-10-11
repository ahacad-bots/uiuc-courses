*** s103d04 ***;

proc sql;
title 'Annual Bonuses for Active Employees';
   select Employee_ID label='Employee Number',
          'Bonus is:' /*Character Constant */,
          Salary *.05 format=comma12.2
      from orion.Employee_Payroll
      where Employee_Term_Date is missing
      order by Salary desc
;
quit;
title;

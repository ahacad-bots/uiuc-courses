*** s102d09 ***;

proc sql;
   select Employee_ID, Salary,
          Salary * .10 as Bonus
      from orion.Employee_Payroll;
quit;


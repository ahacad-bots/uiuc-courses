*** s102d08 ***;

proc sql;
   select Employee_ID, Employee_Gender,
          Salary
      from orion.Employee_Payroll;
quit;

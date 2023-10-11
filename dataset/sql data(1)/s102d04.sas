*** s102d04 ***;

proc sql noexec;
   select Employee_ID, Employee_Gender,
          Salary
      from orion.Employee_Payroll
      where Employee_Gender = 'F'
      order by Salary desc;
	reset exec;
	select Employee_ID, Employee_Gender,
          Salary
      from orion.Employee_Payroll
      where Employee_Gender = 'F'
      order by Salary desc;
quit;

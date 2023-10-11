*** s102a01 ***; 

  /* Step 1 */
proc sql;
   select Employee_ID, Employee_Gender,
           Salary
      from orion.Employee_Payroll
      where Employee_Gender = 'M'
      order by Employee_ID;
quit;

  /* Step 2 */
proc sql;
   from orion.Employee_Payroll
   select Employee_ID, Employee_Gender,
          Salary
      where Employee_Gender = 'M'
      order by EmpID;
quit;

  /* Step 3 */
proc sql;
   validate
      select Employee_ID, Employee_Gender,
             Salary
	     from orion.Employee_Payroll
         where Employee_Gender = 'M'
         order by Employee_ID;
quit;





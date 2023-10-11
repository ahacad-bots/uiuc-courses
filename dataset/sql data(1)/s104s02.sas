*** s0104s02 ***;

  /* a */
proc sql;
title "Employee IDs for February Anniversaries";
   select Employee_ID
      from orion.Employee_Payroll
      where month(Employee_Hire_Date)=2;
quit;
title;

  /* b */
proc sql;
title "Employees with February Anniversaries";
   select  Employee_ID,
           scan(Employee_name,2,', ') length=15 
              as FirstName 'First Name',
           scan(Employee_name,1,', ') length=15 
              as LastName 'Last Name'
      from orion.Employee_addresses
      where Employee_ID in
         (select Employee_ID
             from orion.Employee_Payroll
             where month(Employee_Hire_Date)=2)
      order by LastName;
quit;
title;

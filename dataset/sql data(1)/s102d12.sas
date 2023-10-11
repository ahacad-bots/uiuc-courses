*** s102d12 ***;

proc sql;
   select Employee_ID, Job_Title, Salary
      from orion.Staff
      where Salary > 112000;
quit;

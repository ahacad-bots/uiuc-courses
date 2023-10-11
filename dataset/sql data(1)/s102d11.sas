*** s102d11 ***;

  /* Step 1 */
proc sql;
   select Department
      from orion.Employee_Organization;
quit;

  /* Step 2 - Eliminating Duplicate Rows */
proc sql;
   select distinct Department
      from orion.Employee_Organization; 
quit;

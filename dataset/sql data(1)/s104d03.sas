*** s104d03 ***;

  /* < ANY */
proc sql;
title 'Level IV Sales Reps Who Earn Less Than';
title2 'Any Lower Level Sales Reps.';
   select  Employee_ID, Salary
      from orion.Staff
      where Job_Title='Sales Rep. IV'  
            and salary < any 
               (select salary
                   from orion.Staff
                   where Job_Title in 
                         ('Sales Rep. I','Sales Rep. II',
                         'Sales Rep. III'));
quit;
title;

  /*Equivalent code for < ANY */
proc sql;
title 'Level IV Sales Reps. Who Earn Less Than';
title2 'Any Lower Level Sales Reps.';
   select  Employee_ID, Salary
      from orion.Staff
      where Job_Title='Sales Rep. IV' 
            and salary <  
        (select max(salary)
            from orion.Staff
            where Job_Title in 
                  ('Sales Rep. I','Sales Rep. II',
                  'Sales Rep. III'));
quit;
title;


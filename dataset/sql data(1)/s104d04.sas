  *** s104d04 ***;

proc sql;
title "Job Titles and Salaries of Employees";
title2 "That Earn More Than";
title3 "All level IV Employees";
   select Job_Title, Salary
      from orion.Staff
      where salary > all 
        (select salary
            from orion.Staff
            where Job_Title contains 'IV');
quit;

***  Alternative to > ALL ***;
proc sql;
title "Job Titles and Salaries of Employees";
title2 "That Earn More Than";
title3 "All Level IV Employees";
   select Job_Title, Salary
      from orion.Staff
      where salary > 
        (select max(salary)
            from orion.Staff
            where Job_Title contains 'IV');
quit;



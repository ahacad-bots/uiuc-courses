*** s105d13 ***;

proc sql;
title  'Sales Department Average Salary'; 
title2 'By Job Title';
   select Job_Title, 
          avg(Salary) as Job_Avg format=comma7.
      from orion.Employee_Payroll as p, 
           orion.Employee_Organization as o
      where p.Employee_ID=o.Employee_ID
            and not Employee_Term_Date
            and o.Department="Sales"
      group by Job_Title
;
quit;
title;

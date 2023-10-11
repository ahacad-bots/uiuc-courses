*** s105d14 ***; 

proc sql;
title  'Employees with salaries less than';
title2 '95% of the average for their job';
   select Employee_Name, emp.Job_Title, 
          Salary format=comma7., Job_Avg format=comma7.
      from (select Job_Title, 
                   avg(Salary) as Job_Avg format=comma7.
               from orion.Employee_Payroll as p, 
                    orion.Employee_Organization as o
               where p.Employee_ID=o.Employee_ID
                     and not Employee_Term_Date
                     and o.Department="Sales"
               group by Job_Title) as job,
           orion.Salesstaff as emp
       where emp.Job_Title=job.Job_Title
             and Salary < Job_Avg*.95
       order by Job_Title, Employee_Name
;
quit;
title;


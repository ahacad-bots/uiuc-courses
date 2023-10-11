*** s104d01 ***;


/* Step 1 */
proc sql;
select avg(Salary) as MeanSalary
      from orion.Staff;
quit;

  /* Step 2 */
proc sql;
   select Job_Title,avg(Salary) as MeanSalary
      from orion.Staff
      group by Job_Title
      having avg(Salary) >  xxxxx.xx;
quit;

  /* Step 3 */
proc sql;
   select Job_Title, avg(Salary) as MeanSalary
      from orion.Staff
      group by Job_Title
      having avg(Salary) > 
         (select avg(Salary) as MeanSalary
             from orion.Staff);
quit;

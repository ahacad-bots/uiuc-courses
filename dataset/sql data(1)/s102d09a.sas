*** s102d09a ***;

proc sql;  
   select Job_Title, Salary
      from orion.Staff;
quit;

 /* Method 1 */
proc sql;
   select Job_Title, Salary, 
          case  scan(Job_Title,-1,' ')
             when 'I' then Salary*.05 
             when 'II' then Salary*.07 
             when 'III' then Salary*.10
             when 'IV' then Salary*.12 
             else salary*.08
          end as Bonus
      from orion.Staff;
quit;

 /* Method 2 */
proc sql;
   select Job_Title, Salary,
          case
             when scan(Job_Title,-1,' ')='I' 
                  then salary*.05 
             when scan(Job_Title,-1,' ')='II' 
                  then salary*.07 
             when scan(Job_Title,-1,' ')= 'III' 
                  then salary*.10
             when scan(Job_Title,-1,' ')= 'IV' 
                  then salary*.12 
             else salary*.08
          end as Bonus
      from orion.Staff;
quit;



*** s106s07 ***;

proc sql;
title 'Payroll Report for Sales Representatives';
   select 'Total Paid to ALL Female Sales Representatives', 
           sum(Salary) format=dollar14., count(*) label='Total'
	  from orion.Salesstaff
	  where gender='F' and  Job_Title like '%Rep%'
   union 
   select 'Total Paid to ALL Male Sales Representatives', 
          sum(Salary) format=dollary14. , count(*) label='Total'
	  from orion.Salesstaff
	  where gender='M' and Job_Title like '%Rep%';
quit;
title;

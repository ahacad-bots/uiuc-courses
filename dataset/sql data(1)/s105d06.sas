*** s105d06 ***;

title "Australian Employees Birthday Months"; 
proc sql;
   select Employee_Name as Name format=$25., 
          City format=$25.,
          month(Birth_Date) 'Birth Month' format=3.
   /* Inner Join Syntax */
   from orion.Employee_Payroll
        inner join
        orion.Employee_Addresses
        on Employee_Payroll.Employee_ID=
           Employee_Addresses.Employee_ID 
   /* WHERE clause merely subsets */
   where Country='AU'
   order by 3,City, Employee_Name;
quit;
title;

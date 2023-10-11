*** s105d05 ***;  

proc sql;
title "Australian Employees Birthday Months"; 
   select  Employee_Name as Name format=$25.,
           City format=$25.,
           month(Birth_Date) 'Birth Month' format=3.
      /* Inner Join Syntax: Multiple tables on FROM clause */
      from orion.Employee_Payroll,orion.Employee_Addresses
      /* Join criteria*/
      where Employee_Payroll.Employee_ID=
            Employee_Addresses.Employee_ID 
            /* subsetting criteria*/
            and Country='AU'
      order by 3,City, Employee_Name;
quit;
title;

***   s104s05 ***;

proc sql;
title "Australian Employees' Birth Months"; 
   select Employee_ID, 
          month(Birth_date) as BirthMonth format=3.
      from orion.Employee_Payroll as EP
      where 'AU' = 
        (select Country
            from orion.Employee_Addresses as EA
            where EA.Employee_ID=EP.Employee_ID
         )
      order by 2
   ;
quit;
title;

 /* Alternative Solution with non-correlated Query */
proc sql;
title "Australian Employees' Birth Months"; 
   select Employee_Id, month(birth_date) as BirthMonth
      from orion.Employee_Payroll
      where employee_id in
        (select Employee_Id 
            from orion.Employee_Addresses
            where country='AU'
         )
      order by BirthMonth
   ;
quit;
title;

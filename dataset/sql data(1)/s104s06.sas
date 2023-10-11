*** s104s06 ***;

proc sql;
title  "Employees With Donations >  0.02 Of Their Salary";
   select Employee_ID, Employee_Gender,
          Marital_status
      from orion.Employee_Payroll
      where Employee_ID in 
        (select Employee_ID
            from orion.Employee_Donations
            where Employee_Payroll.Employee_ID=
                  Employee_Donations.Employee_ID
                  and sum(qtr1,qtr2,qtr3,qtr4)/salary > .002
         )
      order by Employee_ID
   ;
quit;
title;


 /* Alternative using the EXISTS condition */
proc sql;
title  "Employees With Donations >  0.02 Of Their Salary";
   select Employee_ID, Employee_Gender,
          Marital_status
      from orion.Employee_Payroll
      where exists
        (select * 
            from orion.Employee_Donations
            where Employee_Payroll.Employee_ID=
                  Employee_Donations.Employee_ID
                  and sum(qtr1,qtr2,qtr3,qtr4)/salary > .002
         )
      order by Employee_ID
   ;
quit;
title;

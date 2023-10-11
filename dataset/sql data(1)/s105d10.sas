*** s105d10 ***;

proc sql;
   select Employee_Payroll.Employee_ID, 
          Employee_Gender, Recipients
      from orion.Employee_Payroll 
           left join 
           orion.Employee_donations
      on Employee_Payroll.Employee_ID= 
         Employee_donations.Employee_ID
      where marital_status="M"
;
quit;

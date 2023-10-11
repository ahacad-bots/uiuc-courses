*** s105d11 ***;

proc sql;
   select p.Employee_ID, Employee_Gender, 
          Recipients
      from orion.Employee_Payroll as p
           left join 
           orion.Employee_donations as d
      on p.Employee_ID=d.Employee_ID
      where marital_status="M"
;
quit;

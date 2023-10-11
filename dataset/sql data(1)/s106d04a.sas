*** s106d04a ***;

proc sql;
   select count(*) 'No. Non-Sales Employees'
      from (select *
               from orion.Employee_organization
               except all
             select *
                from orion.Sales);
quit;

proc contents data=orion.Employee_organization
               position;
   title 'ORION.Employee_organization';
run;
title;

proc contents data=orion.Sales position;
   title 'ORION.Sales';
run;
title;

proc sql;
   select count(*) 'No. Non-Sales Employees'
      from (select *
               from orion.Employee_organization
            except all corr
            select * 
               from orion.Sales);
quit;

*** s106s03 ***;

proc sql;
   select count(*) label='No. Employees w/ No Charitable Donations'
     from (select Employee_ID
              from orion.Employee_organization
           except
            select Employee_ID
               from orion.Employee_donations);
quit;

*** s104d02 ***;

proc sql;
   select Employee_ID
      from orion.Employee_Payroll
       where month(Birth_Date)=2;
quit;

proc sql;
   select Employee_ID, Employee_Name, City, Country
      from orion.Employee_Addresses
      where Employee_ID in
         (select Employee_ID
            from orion.Employee_Payroll
            where month(Birth_Date)=2)
      order by 1;
quit;

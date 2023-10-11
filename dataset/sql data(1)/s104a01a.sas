*** s104a01a ***;

proc sql;
   select Employee_ID, 
          Employee_Name,City, Country
      from orion.Employee_Addresses
      where Employee_ID =
        (select Employee_ID
            from orion.Employee_Payroll
            where month(Birth_Date)=2);
quit;

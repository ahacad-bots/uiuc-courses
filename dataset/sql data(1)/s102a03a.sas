*** s102a03a ***;

proc sql;  
   select Employee_Name, Employee_ID
      from orion.Employee_Addresses
      where Employee_Name contains ', N'; 

   select Employee_Name, Employee_ID
      from orion.Employee_Addresses
      where Employee_Name like '%, N%'; 

   select  Employee_Name, Employee_ID
      from orion.Employee_Addresses
      where scan(Employee_Name,2,',') like ' N%'; 

   select Employee_Name, Employee_ID
      from orion.Employee_Addresses
      where substr(scan(Employee_Name,2,','),1,3) contains ' N'; 

quit;

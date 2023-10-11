 *** s102a03 ***;

proc sql;
   select Employee_Name, Employee_ID
      from orion.Employee_Addresses
      where <insert where clause here>
 ;
quit;

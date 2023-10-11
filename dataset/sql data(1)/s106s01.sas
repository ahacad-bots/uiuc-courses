*** s106s01 ***;

proc sql;
title "Employee IDs with Phone Numbers But Not Address Information";
   select Employee_ID 
      from orion.Employee_phones
   except 
   select Employee_ID 
      from orion.Employee_addresses	;
quit;
title;

   /* Alternative Solution using the CORR modifier */
proc sql;
title "Employee IDs with Phone Numbers But Not Address Information";
   select *
      from orion.Employee_phones
   except corr 
   select *
      from orion.Employee_addresses	;
quit;
title;


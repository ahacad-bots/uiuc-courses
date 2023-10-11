  *** s107s01 ***;
  /* a. */
proc sql;
   create view orion.Phone_List as
      select Department format=$25., 
             Employee_Name as Name format=$25.0,
		     Phone_Number 'Home Phone' format=$16.
         from orion.Employee_addresses as a,
              orion.Employee_phones as p,
              orion.Employee_organization as o
         where a.Employee_ID=p.Employee_ID and
               o.Employee_ID=p.Employee_ID and
               Phone_Type="Home"
;
quit;
  /* b. */
proc sql;
title "Engineering Department Home Phone Numbers";
   select Name, Phone_Number 
      from orion.Phone_List
      where Department="Engineering"
      order by Name
;
quit;
title;

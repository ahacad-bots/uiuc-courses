*** s108d01 ***; 
options ls=80; 
  /* Default output */
proc sql;
title "Default Output";
   select * 
      from orion.Employee_Organization
;
quit;

proc sql flow=15;
title "Flow=15 Option";
   select * 
      from orion.Employee_Organization
;
quit;

proc sql flow=15 double;
title "Flow=15 and Double Options";
   select * 
      from orion.Employee_Organization
;
quit;

proc sql flow=6 25;
title "Flow=6 25 Option";
   select * 
      from orion.Employee_Organization
;
quit;
title;

  /* Choosing Flow Boundaries */
proc sql;
   select "Flow=", min (A,B,C,D),max (A,B,C,D) 
      from (select max(length(put(Employee_ID,z6.))) as A,
                   max(length(Job_Title)) as B, 
                   max(Length(Department)) as C,
                   max(length(put(Manager_ID,z6.)))as D
               from orion.Employee_Organization)
;
quit;

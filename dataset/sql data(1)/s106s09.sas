*** s106s09 ***;

  /* a */

proc sql;
title 'Results with UNION operator ';
   select *
      from orion.Qtr1_2007
   union 
   select *
      from orion.Qtr2_2007;
quit;
title;

 /* b */
options ls=140;
proc sql;
title 'Results with OUTER UNION operator ';
   select *
      from orion.Qtr1_2007
   outer union 
   select *
      from orion.Qtr2_2007;
quit;
title;

/* c - NO*/

/* d - NO*/
proc sql;
title 'Results with  UNION  operator and CORR modifier ';
   select *
      from orion.Qtr1_2007
   union corr 
   select *
      from orion.Qtr2_2007;
quit;
title;


proc sql;
title 'Results with  OUTER UNION  operator and CORR modifier ';
   select *
      from orion.Qtr1_2007
   outer union corr 
   select *
      from orion.Qtr2_2007;
quit;
title;

*** s106s08 ***;

proc sql;
title 'First and Second Quarter 2007 Sales ';
   select *
      from orion.Qtr1_2007
   outer union corr
   select *
      from orion.Qtr2_2007;
quit;
title;

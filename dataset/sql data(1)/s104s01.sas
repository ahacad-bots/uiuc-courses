*** s104s01 ***;

 /* a */

title;
proc sql;
   select avg(Quantity) as MeanQuantity 
      from orion.Order_Fact;
quit;

  /* b */

title "Employees whose Average Quantity Items Sold";
title2 "Exceeds the Company's Average Items Sold";
proc sql;
   select Employee_ID, 
          avg(Quantity) as MeanQuantity format=4.2
      from orion.Order_Fact
      group by Employee_ID
      having MeanQuantity >
         (select avg(Quantity)
             from orion.Order_Fact);
quit;
title;

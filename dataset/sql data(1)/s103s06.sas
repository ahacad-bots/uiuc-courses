*** s103s06 ***;

proc sql;
title "Customer Demographics: Gender by Country";
   select Country, Count(*) as Customers,
          sum(Gender="M") as Men,
          sum(Gender="F") as Women,
          calculated Men/calculated Customers 'Percent Male' 
             format=percent6.1
      from orion.Customer
      group by Country
      order by 5, Country
;
quit;
title;

*** s106s02 ***;

proc sql;
title 'Customers Who Placed Orders';
   select Customer_ID
      from orion.Order_fact
   intersect 
   select Customer_ID
      from orion.Customer;
quit;
title;

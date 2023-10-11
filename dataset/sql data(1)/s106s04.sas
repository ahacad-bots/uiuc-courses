*** s106s04 ***;

proc sql;
   select count(*) label='No. Customers w/ Orders'
      from (select Customer_ID
               from orion.Order_fact
            intersect 
            select Customer_ID
               from orion.Customer);
quit;
title;

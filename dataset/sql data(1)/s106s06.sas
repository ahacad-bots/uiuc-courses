*** s106s06 ***;

proc sql;
title 'Name of Customers Who Placed Orders';
   select Customer_ID, Customer_name
      from orion.Customer
	  where Customer_id in
        (select Customer_ID
            from orion.Order_fact
         intersect 
         select Customer_ID
            from orion.Customer	);
quit;
title;

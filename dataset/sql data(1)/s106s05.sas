*** s106s05 ***;

proc sql number;
title 'Sales Reps Who Made No Sales in 2007';
   select Employee_ID, Employee_Name 
      from orion.Employee_addresses
	  where Employee_ID in 
        (select Employee_ID 
            from orion.Sales
      	    where Job_Title like '%Rep%'
	     except all
         select Employee_ID 
            from orion.Order_fact
	        where year(order_date)=2007);
quit;
title;

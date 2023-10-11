*** s108d02 ***;

proc sql inobs=10;
title "orion.Price_List - INOBS=10";
   select Product_ID, 
          Unit_Cost_price format=comma8.2,
	      Unit_Sales_Price format=comma8.2, 
          Unit_Sales_Price-Unit_Cost_Price 
          as Margin format=comma8.2
      from orion.Price_List
;
quit;
title;
  /*****************************************************
  ** INCORRECT ** INCORRECT ** INCORRECT ** INCORRECT **
  INOBS option doesn't work here; not enough rows are 
  read in to produce a result.  We should read in ALL
  rows and instead limit the rows OUTPUT (see next 
  program for the correct answer)
  ** INCORRECT ** INCORRECT ** INCORRECT ** INCORRECT **
  *****************************************************/

proc sql inobs=10;
title "10 Most Profitable Customers - join with INOBS=10";
title2 "This report didn't work!";
   select Customer_ID, sum(Unit_Sales_Price-Unit_Cost_Price) 
          as Profit_2007 format=comma8.2
      from orion.Price_List as p,
	       orion.Order_Fact as o
	  where p.Product_ID=o.Product_id
	        and year(Order_date) =2007
	  group by Customer_ID
	  order by Profit_2007 desc
;
quit;
title;

  /*****************************************************
  CORRECT SOLUTION * CORRECT SOLUTION * CORRECT SOLUTION 
  *****************************************************/
proc sql outobs=10;
title "10 Most Profitable Customers";
   select Customer_ID, sum(Unit_Sales_Price-Unit_Cost_Price)
          as Profit_2007 format=comma8.2
      from orion.Price_List as p,
	       orion.Order_Fact as o
	  where p.Product_ID=o.Product_id
	        and year(Order_date) =2007
	  group by Customer_ID
	  order by Profit_2007 desc
;
quit;
title;

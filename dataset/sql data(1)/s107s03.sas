  *** s107s03 ***;  
  /* a. */
proc sql;
   create view orion.Current_Catalog as
      /*orion.Product_Dim includes duplicate records*/
      select distinct d.*
          , round((l.Unit_Sales_Price *
                    factor**(year( Today() )-year( Start_Date )))
                  ,.01) 'Current Retail Price' format=dollar13.2
             as Price 
      from orion.Product_dim as d, 
           orion.Price_list as l
      where d.Product_ID=l.Product_ID  
;
quit;
options nonumber nodate;
  /* b. */
proc sql flow=5 35;
title "Current Roller Skate Prices";
   select Supplier_Name, Product_Name, Price 
      from orion.Current_Catalog 
      where lowcase(Product_Name) like '%roller skate%'
      order by Supplier_Name, Price
;
quit;
title;

  /* c. */
proc sql flow=5 35;
title "2009 prices > 5.00 higher than original price";
   select c.Product_Name, Unit_Sales_Price 'Old Price', 
          Price 'New Price', 
          Price-Unit_Sales_Price as Increase format=dollar9.2
      from orion.Current_Catalog as c,
           orion.Price_list as p
      where c.Product_ID=p.Product_id 
            and calculated Increase gt 5
      order by Increase Desc
;
quit;
title;

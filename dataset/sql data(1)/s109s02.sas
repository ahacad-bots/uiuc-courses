*** s109s02 ***;
proc sql;
   create table work.Products as
      select distinct * 
         from orion.Product_DIM
  ;
quit;

proc sql;
   create unique index Product_ID
      on Products (Product_ID)
   ;   
quit;

options msglevel=i;
proc sql;
title "2007 Products Purchased";
   select distinct Product_Name, Supplier_Name
      from Products as p, orion.Order_fact as o
      where o.product_id=p.product_id
        and year(Order_Date)=2007
;
quit;

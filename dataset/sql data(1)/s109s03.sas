*** s109s03 ***;
proc sql;
   create table work.Customers as
      select distinct * 
         from orion.Customer
   ;
   create table work.Orders as
      select * 
         from orion.Order_Fact
   ;
   create table work.Products as
      select distinct * 
         from orion.Product_DIM
   ;
quit;

proc sql;
   create unique index Customer_ID
      on Customers (Customer_ID)
   ;
   create index Customer_ID
      on Orders (Customer_ID)
   ;
   create unique index Product_ID
      on Products (Product_ID)
   ;
quit;

options msglevel=i;
proc sql flow=15 40;
title "Products Ordered by South African Customers in 2007";
   select distinct p.Product_Name, p.Supplier_Name
      from Customers as c, 
           Orders as o , 
           Products  as p
     where o.product_id=p.product_id
       and c.Customer_ID=o.Customer_id
       and c.Country="ZA"
       and year(o.Order_Date)=2007
   ;
quit;


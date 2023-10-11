*** s109e03 ***;
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

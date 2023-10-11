*** s109s01 ***;
proc sql;
   create table work.Products as
      select distinct * 
         from orion.Product_DIM
   ;
   create index Product_Name
      on Products (Product_Name)
;
quit;
options msglevel=i;
proc sql;
title "T-Shirt list";
   select distinct Product_Name format=$45.,
                   Supplier_Name format=$30.
      from Products 
      where Product_Name like '%T-Shirt%'
   ;
quit;


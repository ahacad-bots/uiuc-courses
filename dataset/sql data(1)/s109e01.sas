*** s109e01 ***;  
proc sql;
   create table work.Products as
      select distinct * 
         from orion.Product_DIM
;
quit;

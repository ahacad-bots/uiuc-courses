*** s107d01 ***;

proc sql;
   create table Discounts
      (Product_ID num format=z12.,
       Start_Date date,
       End_Date date,
       Discount num format=percent.)
;
quit;

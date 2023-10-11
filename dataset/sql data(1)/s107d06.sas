*** s107d06 ***;
proc sql;
   create table discounts
     (Product_ID num format=z12.,
      Start_Date date,
      End_Date date,
      Discount num format=PERCENT.
      )
;
   insert into discounts
     (Product_ID,Start_Date,End_Date,Discount)
      values (220200200022,'01Mar2007'd,'31Mar2007'd,.35)
      values (220200200024,'01Mar2007'd,'31Mar2007'd,.35)
;
   select *
      from discounts;
quit;

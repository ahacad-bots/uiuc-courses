  *** s110d01 ***;
libname MyDBMS ACCESS "./sql1.mdb"; /* Windows */
  /* CONNECTION TO MS ACCESS NOT AVAIALBE ON z/OS MAINFRAME */
proc sql;
title "Report using libname access to DBMS";
   select distinct Customer_ID format=12., 
                   Order_ID format=12., 
                   datepart(Order_Date) as Date format=mmddyy10.
      from MyDBMS.Store_Orders_2007
      order by Customer_ID, Date
;
quit;
title;
proc sql;
   create table MyDBMS.Test as
      select Product_Name, Price
         from MyDBMS.Catalog_2007
   ;
   select * 
      from MyDBMS.Test
      order by Price desc;
   ;
   drop table MyDBMS.Test;
quit;
libname MyDBMS clear;

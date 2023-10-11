  *** s110d02 ***;
  /* ODBC CONNECTION TO MS ACCESS NOT AVAIALBE ON z/OS MAINFRAME*/
proc sql;
   connect to ACCESS as MyDBMS 
     (path="./sql1.mdb");
title "Report using SQL Passthrough";
   select *
      from connection to MyDBMS
        (select Product_Name, Price 
           from Catalog_2007
           order by Product_Name)
   ;
   disconnect from MyDBMS;
quit;

proc sql;
   connect to ACCESS as MyDBMS 
     (path="./sql1.mdb");
title "SQL Passthrough Results Joined With SAS Table";
   select of.Product_ID, Product_Name, Price, count(*) as Number_Sold
      from connection to MyDBMS
         (select Product_ID, Product_Name, Price 
             from Catalog_2007
             order by Product_Name) as pt,
	                  orion.Order_Fact as of
	         where of.Product_ID=pt.Product_ID
	         group by of.Product_ID
;
   disconnect from MyDBMS;
quit;

libname MyDBMS ACCESS "./sql1.mdb";
  /* ODBC CONNECTION TO MS ACCESS NOT AVAIALBE ON z/OS MAINFRAME*/
proc sql;
   connect to ACCESS as MyDBMS 
      (path="./sql1.mdb");
   execute (alter table Catalog_2007
            add column Comments TEXT(10))
      by MyDBMS;
   execute (update Catalog_2007
            set Comments='Pricey!' 
            where Price > 100)
      by MyDBMS;
   execute (create view Test AS 
              select Product_Name, Price, Comments 
              from Catalog_2007)
      by MyDBMS;
   disconnect from MyDBMS;
title "Report using the view 'MyDBMS.Test'";
   select *
      from MyDBMS.Test
	  where Comments ne "";
quit;

proc sql;
   connect to ACCESS as MyDBMS 
     (path="./sql1.mdb");
   execute (alter table Catalog_2007
            drop column Comments)
     by MyDBMS;
   execute (drop view Test)
     by MyDBMS;
   disconnect from MyDBMS;
quit;



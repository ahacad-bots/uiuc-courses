/*******************************
***    Unit 2-2 Exercises    ***
*******************************/

libname orion 'D:\440\Unit2';


/* Exercise 1 */
data work.price_increase;
   set orion.prices;
   Year=1;
   Unit_Price=Unit_Price * Factor;
   output;
   Year=2;
   Unit_Price=Unit_Price * Factor;
   output;
   Year=3;
   Unit_Price=Unit_Price * Factor;
   output;
run;
proc print data=work.price_increase;
    var Product_ID Unit_Price Year;
run;



/* Exercise 2 */
data work.extended;
   set orion.discount;
   drop unit_sales_price;
   where Start_Date='01dec2007'd;
   Promotion='Happy Holidays';
   Season='Winter';
   output;
   Start_Date='01jul2008'd;
   End_Date='31jul2008'd;
   Season='Summer';
   output;
run;

title 'All discount ranges with the Happy Holidays promotion';
proc print data=work.extended;
run;
title;



/* Exercise 3 */
data work.lookup;
   set orion.country;
   Outdated='N';
   output;
   if Country_FormerName ne ' ' then do;
      Country_Name=Country_FormerName;
	Outdated='Y';
	output;
   end;
   drop Country_FormerName Population;
run;

title 'Current and Outdated Country Name Data';
proc print data=work.lookup;
run;
title;



/* Exercise 4 */
data work.admin work.stock work.purchasing;
   set orion.employee_organization;
   if Department='Administration' then output work.admin;
   else if Department='Stock & Shipping' then output work.stock;
   else if Department='Purchasing' then output work.purchasing;
run;

  /* Alternate solution */
data work.admin work.stock work.purchasing;
   set orion.employee_organization;
   select (Department);
      when ('Administration') output work.admin;
	  when ('Stock & Shipping') output work.stock;
	  when ('Purchasing') output work.purchasing;
	  otherwise;
   end;
run;

title 'Administration Employees';
proc print data=work.admin;
run;
title;

title 'Stock and Shipping Employees';
proc print data=work.stock;
run;
title;

title 'Purchasing Employees';
proc print data=work.purchasing;
run;
title;



/* Exercise 5 */
data work.fast work.slow work.veryslow;
   set orion.orders;
   where Order_Type in (2,3);
   ShipDays=Delivery_Date-Order_Date;
   if ShipDays<3 then output work.fast;
   else if 5<=ShipDays<=7 then output work.slow;
   else if ShipDays>7 then output work.veryslow;
   drop Employee_ID;
run;

title 'Orders taking more than 7 days to deliver';
proc print data=work.veryslow;
run;
title;


/* Exercise 6 */
data work.fast work.slow work.veryslow;
   set orion.orders;
   where Order_Type in (2,3);
   ShipDays=Delivery_Date-Order_Date;
   select;
	  when (ShipDays<3) output work.fast;
      when (5<=ShipDays<=7)   output work.slow;
      when (ShipDays>7) output work.veryslow;
	  otherwise;
   end;
   drop Employee_ID;
run;

title 'Orders taking more than 7 days to deliver';
proc print data=work.veryslow;
run;
title;


/* Exercise 7 */
  /* a */
data work.sales (keep=Employee_ID Job_Title Manager_ID)
     work.exec (keep=Employee_ID Job_Title);
   set orion.employee_organization;
   if Department='Sales' then output work.sales;
   else if Department='Executives' then output work.exec;
run;

  /* b */
title 'Sales Employees';
proc print data=work.sales (obs=6);
run;
title;

  /* c */
title 'Executives';
proc print data=work.exec (firstobs=2 obs=3);
run;
title;


/* Exercise 8 */
  /* a */
data work.instore (keep=Order_ID Customer_ID Order_Date)
     work.delivery (keep=Order_ID Customer_ID Order_Date ShipDays);
   set orion.orders (obs=30);
   where Order_Type=1;
   ShipDays=Delivery_Date-Order_Date;
   if ShipDays=0 then output work.instore;
   else if ShipDays>0 then output work.delivery;
run;

  /* b */
data work.instore (keep=Order_ID Customer_ID Order_Date)
     work.delivery (keep=Order_ID Customer_ID Order_Date ShipDays);
  set orion.orders;
  where Order_Type=1;
  ShipDays=Delivery_Date-Order_Date;
  if ShipDays=0 then output work.instore;
  else if ShipDays>0 then output work.delivery;
run;

title 'Deliveries from In-store Purchases';
proc print data=work.delivery;
run;
title;

  /* c */
title 'In-stock Store Purchases, By Year';
proc freq data=work.instore;
   tables Order_Date;
   format Order_Date year.;
run;
title;

/***********************************
***      Unit 2-3 Exercises      ***
************************************/

libname orion 'D:\440\Unit2';


/* Exercise 1 */
data work.mid_q4;
   set orion.order_fact;
   where '01nov2004'd <= Order_Date <= '14dec2004'd;
   Sales2Dte+Total_Retail_Price;
   Num_Orders+1;
run;


title 'Orders from 01Nov2004 through 14Dec2004';
proc print data=work.mid_q4;
   format Sales2Dte dollar10.2;
   var Order_ID Order_Date Total_Retail_Price Sales2Dte Num_Orders;
run;
title;



/* Exercise 2 */
  /* part a */
data work.typetotals;
   set orion.order_fact (obs=10);
   where year(Order_Date)=2005;
   /* There are equivalent WHERE statements that would work */
   if Order_Type=1 then TotalRetail+Quantity;
   else if Order_Type=2 then TotalCatalog+Quantity;
   else if Order_Type=3 then TotalInternet+Quantity;
run;

   /* part b */
proc print data=work.typetotals;
run;

   /* part c */
data work.typetotals;
   set orion.order_fact;
   where year(Order_Date)=2005;
   /* There are equivalent WHERE statements that would work */
   if Order_Type=1 then TotalRetail+Quantity;
   else if Order_Type=2 then TotalCatalog+Quantity;
   else if Order_Type=3 then TotalInternet+Quantity;
   keep Order_ID Order_Date TotalRetail 
        TotalCatalog TotalInternet;
run;

title '2005 Accumulating Totals for Each Type of Order';
proc print data=work.typetotals;
run;
title;



/* Exercise 3 */
data work.monthtotals;
   set orion.order_fact;
   where year(Order_Date)=2007;
   retain rmonth;
   if month(Order_Date) ne rmonth then do; 
      MonthSales=0;
      rmonth=month(Order_Date);
   end;
   monthsales+Total_Retail_Price;
   keep Order_ID Order_Date MonthSales Total_Retail_Price;
run;


title 'Accumulating Totals by Month in 2007';
proc print data=work.monthtotals;
   format Total_Retail_Price MonthSales dollar10.2;
run;
title;


/* Exercise 4 */
proc sort data=orion.order_summary out=work.sumsort;
   by Customer_ID;
run;
 
data work.customers;
   set work.sumsort;
   by Customer_ID;
   if first.Customer_ID then Total_Sales=0;
   Total_Sales+Sale_Amt;
   if last.Customer_ID;
   keep Customer_ID Total_Sales;
run;

title 'Total Sales to each Customer';
proc print data=work.customers;
   format Total_Sales dollar11.2;
run;
title;


/* Exercise 5 */
proc sort data=orion.order_qtrsum out=work.custsort;
   by Customer_ID Order_Qtr;
run;

data work.qtrcustomers;
   set work.custsort;
   by Customer_ID Order_Qtr;
   if first.Order_Qtr=1 then do;
      Total_Sales=0;
	  Num_Months=0;
   end;
   Total_Sales+Sale_Amt;
   Num_Months+1;
   if last.Order_Qtr=1;
   keep Customer_ID Order_Qtr Total_Sales Num_Months;
run;

title 'Total Sales to each Customer for each Quarter';
proc print data=work.qtrcustomers;
   format Total_Sales dollar11.2;
run;
title;



/* Exercise 6 */
proc sort data=orion.customer_dim out=work.customers;
  by Customer_Type;
run;

data work.agecheck;
  set work.customers;
  by Customer_Type;
  retain oldest youngest o_ID y_ID;
  if first.Customer_Type=1 then do;
    oldest=Customer_BirthDate;
	youngest=Customer_BirthDate;
	o_ID=Customer_ID;
	y_ID=Customer_ID;
  end;
  if Customer_BirthDate < oldest then do;
    o_ID=Customer_ID;
    oldest=Customer_BirthDate;
  end;
  else if Customer_BirthDate > youngest then do;
    y_ID=Customer_ID;
    youngest=Customer_BirthDate;
  end;
  if last.Customer_Type=1 then do;
    agerange=(youngest-oldest)/365.25;
	output;
  end;
  keep Customer_Type oldest youngest o_ID y_ID agerange;
run;

title 'Oldest and Youngest Customers of each Customer Type';
proc print data=work.agecheck noobs;
  format oldest youngest date9. agerange 5.1;
run;
title;


 /* Alternate solution */
proc sort data=orion.customer_dim out=work.customers;
   by Customer_Type Customer_BirthDate;
run;

data work.agecheck;
   set work.customers;
   by Customer_Type;
   /* Could instead use: by Customer_Type Customer_BirthDate; 
      In this DATA step, either BY statement works. */
   retain oldest youngest o_ID y_ID;
   if first.Customer_Type=1 then do;
      o_ID=Customer_ID;
	  oldest=Customer_BirthDate;
   end;
   /* Having sorted also on Customer_BirthDate, we know the first
   customer in each BY group will be the oldest (have the 
   smallest SAS date value for a Birthday). */
   if last.Customer_Type=1 then do;
      y_ID=Customer_ID;
	  youngest=Customer_BirthDate;
      agerange=(youngest-oldest)/365.25;
	  output;
   end;
   /* Similar story: last in each BY group will be the youngest. */
   keep Customer_Type oldest youngest o_ID y_ID agerange;
run;

title 'Oldest and Youngest Customers of each Customer Type';
proc print data=work.agecheck noobs;
   format oldest youngest date9. agerange 5.1;
run;
title;

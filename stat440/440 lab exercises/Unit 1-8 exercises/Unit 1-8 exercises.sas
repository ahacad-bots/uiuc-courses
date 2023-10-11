/*******************************
***    Unit 1-8 Exercises    ***
*******************************/

libname orion 'D:\440\Unit1';


/* Exercise 1 */
proc print data=orion.shoes_tracker;
   where Product_Category=' ' or
         Supplier_Country not in ('GB','US');
   var Product_Category Supplier_Name Supplier_Country Supplier_ID;
run;

proc freq data=orion.shoes_tracker nlevels;
   tables Supplier_Name Supplier_ID; 
run;


/* Exercise 2 */
proc print data=orion.qtr2_2007;
   where Order_Date>Delivery_Date or
         Order_Date<'01APR2007'd or
         Order_Date>'30JUN2007'd;
run;

proc freq data=orion.qtr2_2007 nlevels;
   tables Order_ID Order_Type; 
run;


/* Exercise 3 */
proc print data=orion.shoes_tracker;
   where propcase(Product_Name) ne Product_Name;
   var Product_ID Product_Name;
run;

proc freq data=orion.shoes_tracker;
   tables Supplier_Name*Supplier_ID / missing;
run;


/* Exercise 4 */
proc means data=orion.price_current n min max;
   var Unit_Cost_Price Unit_Sales_Price Factor;
run;

proc univariate data=orion.price_current;
   var Unit_Sales_Price Factor;
run;


/* Exercise 5 */
proc means data=orion.shoes_tracker min max range fw=15;
   var Product_ID;
   class Supplier_Name;
run;

proc univariate data=orion.shoes_tracker;
   var Product_ID;
run;


/* Exercise 6 */
ods trace on;

ods select ExtremeObs;
proc univariate data=orion.shoes_tracker;
   var Product_ID;
run;

ods trace off;


/* Exercise 7 */
data work.qtr2_2007;
   set orion.qtr2_2007;
   if Order_ID=1242012259 then Delivery_Date='12MAY2007'd;
   else if Order_ID=1242449327 then Order_Date='26JUN2007'd;
run;

proc print data=work.qtr2_2007;
   where Order_Date>Delivery_Date or
         Order_Date<'01APR2007'd or
         Order_Date>'30JUN2007'd;
run;


/* Exercise 8 */
data work.price_current;
   set orion.price_current;
   if Product_ID=220200200022 then Unit_Sales_Price=57.30;
   else if Product_ID=240200100056 then Unit_Sales_Price=41.20;
run;

proc means data=work.price_current n min max;
   var Unit_Sales_Price;
run;

proc univariate data=work.price_current;
   var Unit_Sales_Price;
run;



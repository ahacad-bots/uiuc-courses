/********************************
***    Unit 1-10 Exercises    ***
********************************/

libname orion 'D:\440\Unit1';


/* Exercise 1 */
proc contents data=orion.price_current;
run;
proc contents data=orion.price_new;
run;              

proc append base=orion.price_current
            data=orion.price_new;
run;


/* Exercise 2 */
proc contents data=orion.qtr1_2007;
run;
proc contents data=orion.qtr2_2007;
run;

proc append base=work.ytd 
            data=orion.qtr1_2007;
run;

proc append base=work.ytd 
            data=orion.qtr2_2007 force;
run;


/* Exercise 3 */
proc contents data=orion.shoes_eclipse;
run;
proc contents data=orion.shoes_tracker;
run;
proc contents data=orion.shoes;
run;

proc datasets library=orion nolist;
   append base=shoes data=shoes_eclipse;
   append base=shoes data=shoes_tracker force;
quit;


/* Exercise 4 */
data work.thirdqtr;
   set orion.mnth7_2007 orion.mnth8_2007 orion.mnth9_2007;
run;

proc print data=work.thirdqtr;
run; 


/* Exercise 5 */
proc contents data=orion.sales;
run;
proc contents data=orion.nonsales;
run;

data work.allemployees;
   set orion.sales 
       orion.nonsales(rename=(First=First_Name Last=Last_Name));
   keep Employee_ID First_Name Last_Name Job_Title Salary;
run;

proc print data=work.allemployees;
run;


/* Exercise 6 */
proc sort data=orion.shoes_eclipse
          out=work.eclipsesort;
   by Product_Name;
run;
proc sort data=orion.shoes_tracker
          out=work.trackersort;
   by Product_Name;
run;

data work.e_t_shoes;
   set work.eclipsesort work.trackersort;
   by Product_Name;
   keep Product_Group Product_Name Supplier_ID;
run;

proc print data=work.e_t_shoes;
run;


/* Exercise 7 */
proc contents data=orion.orders;
run;
proc contents data=orion.order_item;
run;

data work.allorders;
   merge orion.orders 
         orion.order_item;
   by Order_ID;
run;

proc print data=work.allorders;
   var Order_ID Order_Item_Num Order_Type 
       Order_Date Quantity Total_Retail_Price;
run;


/* Exercise 8 */
proc sort data=orion.product_list 
          out=work.product_list;
   by Product_Level;
run;

data work.listlevel;
   merge orion.product_level work.product_list ;
   by Product_Level;
run;

proc print data=work.listlevel;
   var Product_ID Product_Name Product_Level Product_Level_Name;
run;


/* Exercise 9 */
proc sql;
   create table work.listlevelsql as
   select Product_ID, Product_Name, 
          product_level.Product_Level, Product_Level_Name
   from orion.product_level, orion.product_list
   where product_level.Product_Level = product_list.Product_Level;
quit;

proc print data=work.listlevelsql;
run;


/* Exercise 10 */
proc sort data=orion.product_list
          out=work.product;
   by Supplier_ID;
run;

data work.prodsup;
   merge work.product(in=P) 
         orion.supplier(in=S);
   by Supplier_ID;
   if P=1 and S=0;
run;

proc print data=work.prodsup;
   var Product_ID Product_Name Supplier_ID Supplier_Name;
run;


/* Exercise 11 */
proc sort data=orion.customer
          out=work.customer;
   by Country;
run;

data work.allcustomer;
   merge work.customer(in=Cust) 
         orion.lookup_country(rename=(Start=Country 
                                      Label=Country_Name) 
                              in=Ctry);
   by Country;
   keep Customer_ID Country Customer_Name Country_Name;
   if Cust=1 and Ctry=1;
run;

proc print data=work.allcustomer;
run;


/* Exercise 12 */
proc sort data=orion.orders
          out=work.orders;
   by Employee_ID;
run;

data work.allorders work.noorders;
   merge orion.staff(in=Staff) work.orders(in=Ord);
   by Employee_ID;
   if Ord=1 then output work.allorders;
   else if Staff=1 and Ord=0 then output work.noorders;
   keep Employee_ID Job_Title Gender Order_ID Order_Type Order_Date;
run;

proc print data=work.allorders;
run;

proc print data=work.noorders;
run;


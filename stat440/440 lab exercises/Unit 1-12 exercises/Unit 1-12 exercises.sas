/********************************
***    Unit 1-12 Exercises    ***
********************************/

libname orion 'D:\440\Unit1';


/* Exercise 1 */
proc freq data=orion.orders nlevels;
   where Order_Type=1;
   tables Customer_ID Employee_ID / noprint;
   title1 'Unique Customers and Salespersons for Retail Sales';
run;

proc freq data=orion.orders nlevels;
   where Order_Type ne 1;
   tables Customer_ID / noprint;
   title1 'Unique Customers for Catalog and Internet Sales';
run;


/* Exercise 2 */
proc format;
   value ordertypes
      1='Retail'
      2='Catalog'
      3='Internet';
run;

proc freq data=orion.orders ;
   tables Order_Date;
   tables Order_Type / nocum;
   tables Order_Date*Order_Type / nopercent norow nocol;
   format Order_Date year4. Order_Type ordertypes.;
   title 'Order Summary by Year and Type';
run;


/* Exercise 3 */
proc freq data=orion.customer_dim order=freq;
   tables Customer_Country Customer_Type Customer_Age_Group;
   title1 'Customer Demographics';
   title3 '(Top two levels for each variable?)';
run;


/* Exercise 4 */
proc freq data=orion.order_fact noprint;
   tables Product_ID / out=product_orders;
run;

data product_names;
   merge product_orders orion.product_list;
   by Product_ID;
   keep Product_ID Product_Name Count;
run;

proc sort data=product_names;
   by descending Count;
run;

proc print data=product_names(obs=10) label;
   var Count Product_ID Product_Name;
   label Product_ID='Product Number'
         Product_Name='Product'
         Count='Orders';
   title 'Top Ten Products by Number of Orders';
run;


/* Exercise 5 */
proc format;
   value ordertypes
      1='Retail'
      2='Catalog'
      3='Internet';
run;

proc means data=orion.order_fact sum;
   var Total_Retail_Price;
   class Order_Date Order_Type;
   format Order_Date year4. Order_Type ordertypes.;
   title 'Revenue (in U.S. Dollars) Earned from All Orders';
run;


/* Exercise 6 */
proc means data=orion.staff nmiss n maxdec=0 nonobs;
   var Birth_Date Emp_Hire_Date Emp_Term_Date;
   class Gender;
   title 'Number of Missing and Non-Missing Date Values';
run;


/* Exercise 7 */
data work.countries(keep=Customer_Country);
   set orion.supplier;
   Customer_Country=Country;
run;

proc means data=orion.customer_dim
           classdata=work.countries
           lclm mean uclm alpha=0.10;
   class Customer_Country;
   var Customer_Age;
   title 'Average Age of Customers in Each Country';
run;


/* Exercise 8 */
proc means data=orion.order_fact noprint nway;
   class Product_ID;
   var Total_Retail_Price;
   output out=product_orders sum=Product_Revenue;
run;

data product_names;
   merge product_orders orion.product_list;
   by Product_ID;
   keep Product_ID Product_Name Product_Revenue;
run;

proc sort data=product_names;
   by descending Product_Revenue;
run;

proc print data=product_names(obs=10) label;
   var Product_Revenue Product_ID Product_Name;
   label Product_ID='Product Number'
         Product_Name='Product'
         Product_Revenue='Revenue';
   format Product_Revenue eurox12.2;
   title 'Top Ten Products by Revenue';
run;


/* Exercise 9 */
proc tabulate data=orion.customer_dim;
   class Customer_Group Customer_Gender;
   var Customer_Age;
   table Customer_Group all,
         Customer_Gender*Customer_Age*(n mean);
   title 'Ages of Customers by Group and Gender';
run;


/* Exercise 10 */
proc tabulate data=orion.customer_dim;
   class Customer_Gender Customer_Group;
   table Customer_Gender, Customer_Group, (n colpctn);
   keylabel colpctn='Percentage' N='Number';
   title 'Customers by Group and Gender';
run;


/* Exercise 11 */
proc tabulate data=orion.order_fact format=dollar12.;
   where CostPrice_Per_Unit > 250;
   class Product_ID Order_Date;
   format Order_Date year4.;
   var Total_Retail_Price;
   table Order_Date=' ', Total_Retail_Price*sum*Product_ID=' '
         / misstext='$0'
           box='High Cost Products (Unit Cost > $250)';
   label Total_Retail_Price='Revenue for Each Product';
   keylabel Sum=' ';
   title;
run;


/* Exercise 12 */
proc tabulate data=orion.Organization_Dim format=dollar12.
              out=work.Salaries;
   class Employee_Gender Company;
   var Salary;
   table Company, (Employee_Gender all)*Salary*mean;
   title 'Average Employee Salaries';
run;

proc sort data=work.Salaries;
   by Salary_Mean;
run;

proc print data=work.Salaries label;
   var Company Employee_Gender Salary_Mean;
   format Salary_Mean dollar12.;
   label Salary_Mean='Average Salary';
   title 'Average Employee Salaries';
run;

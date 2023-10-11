/*******************************
***    Unit 1-5 Exercises    ***
*******************************/

libname orion 'D:\440\Unit1';


/* Exercise 1 */
data work.youngadult;
   set orion.customer_dim;
   where Customer_Gender='F' and 
         Customer_Age between 18 and 36 and
         Customer_Group contains 'Gold';
   keep Customer_Name Customer_Age Customer_BirthDate 
        Customer_Gender Customer_Group;
run;

proc print data=work.youngadult;
run;


/* Exercise 2 */
data work.sports;
   set orion.product_dim;
   where Supplier_Country in ('GB','ES','NL') and 
         Product_Category like '%Sports';
   drop Product_ID Product_Line Product_Group 
        Supplier_Name Supplier_ID;
run;

proc print data=work.sports;
run;


/* Exercise 3 */
data work.tony;
   set orion.customer_dim(keep=Customer_FirstName Customer_LastName); 
   where Customer_FirstName =* 'Tony';
run;

proc print data=work.tony;
run;


/* Exercise 4 */
data work.youngadult;
   set orion.customer_dim;
   where Customer_Gender='F' and 
         Customer_Age between 18 and 35 and
         Customer_Group contains 'Gold';
   keep Customer_Name Customer_Age Customer_BirthDate 
        Customer_Gender Customer_Group;
   label Customer_Gender='Gender'
         Customer_BirthDate='Date of Birth'
         Customer_Group='Member Level';
   format Customer_BirthDate worddate.;
run;

proc contents data=work.youngadult;
run;

proc print data=work.youngadult label;
run; 


/* Exercise 5 */
data work.sports;
   set orion.product_dim;
   where Supplier_Country in ('GB','ES','NL') and 
         Product_Category like '%Sports';
   drop Product_ID Product_Line Product_Group Supplier_ID;
   label Product_Category='Sports Category'
         Product_Name='Product Name (Abbrev)'
		 Supplier_Name='Supplier Name (Abbrev)';
   format Product_Name Supplier_Name $15.;
run;

proc print data=work.sports label;
run;

proc contents data=work.sports;
run;


/* Exercise 6 */
data work.tony;
   set orion.customer_dim(keep=Customer_FirstName Customer_LastName); 
   where Customer_FirstName =* 'Tony';
   format Customer_FirstName Customer_LastName $upcase.;
   label Customer_FirstName='CUSTOMER*FIRST NAME'
         Customer_LastName='CUSTOMER*LAST NAME';
run;

proc print data=work.tony split='*';
run;

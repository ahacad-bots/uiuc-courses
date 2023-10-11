/*******************************
***    Unit 1-7 Exercises    ***
*******************************/

libname orion 'D:\440\Unit1';
/* To use the code as is, remember to change the Current Directory 
   to the location of the raw data files.
   Otherwise, you'll need to include the pathname before the raw 
   data file in the INFILE statement. See Exercise 1. */


/* Exercise 1 */
data work.NewEmployees;
   length First $ 12 Last $ 18 Title $ 25;
   infile 'newemps.csv' dlm=',';
   * OR... ;
   * infile 'D:\440\Unit1\newemps.csv' dlm=',';
   input First $ Last $ Title $ Salary;
run;

proc print data=work.NewEmployees;
run;


/* Exercise 2 */
data work.QtrDonation;
   length IDNum $ 6;
   infile 'donation.dat';
   input IDNum $ Qtr1 Qtr2 Qtr3 Qtr4;
run;

proc print data=work.QtrDonation;
run;


/* Exercise 3 */
data work.supplier_info;
   infile 'supplier.dat';
   input ID 1-5 Name $ 8-37 Country $ 40-41;
run;

proc print data=work.supplier_info;
run;


/* Exercise 4 */
data work.canada_customers;
   length First Last $ 20 Gender $ 1 AgeGroup $ 12;
   infile 'custca.csv' dlm=',';
   input First $ Last $ ID Gender $ 
         BirthDate :ddmmyy. Age AgeGroup $;
   format BirthDate monyy7.;
   drop ID Age;
run;

proc print data=work.canada_customers;
run;


/* Exercise 5 */
data work.us_customers;
   length Name $ 20 Gender $ 1 AgeGroup $ 12;
   infile 'custus.dat' dlm=' ' dsd;
   input Name $ ID Gender $ BirthDate :date.
         Age AgeGroup $;
   format BirthDate monyy7.;
run;

proc print data=work.us_customers;
   var Name Gender BirthDate AgeGroup Age;
run;


/* Exercise 6 */
data work.prices;
   infile 'prices.dat' dlm='*' missover;
   input ProductID StartDate :date. EndDate :date. 
         UnitCostPrice :dollar. UnitSalesPrice :dollar.;
   label ProductID='Product ID'
         StartDate='Start of Date Range'
         EndDate='End of Date Range'
         UnitCostPrice='Cost Price per Unit'
         UnitSalesPrice='Sales Price per Unit';
   format StartDate EndDate mmddyy10.
          UnitCostPrice UnitSalesPrice 8.2; 
run;

proc print data=work.prices label;
run;

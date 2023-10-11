/***********************************
***      Unit 2-4 Exercises      ***
************************************/

libname orion 'D:\440\Unit2';


/* Exercise 1 */
data sales_staff;
   infile 'sales1.dat';  
   /* Be sure to include the appropriate pathname for the file
      or change the working folder. */
   input  @1 Employee_ID 6.
         @21 Last_Name $18.
         @43 Job_Title $20.
         @64 Salary Dollar8.
         @87 Hire_Date mmddyy10.;
run;

title 'Australian and US Sales Staff';
proc print data=sales_staff noobs;
run;
title;


/* Exercise 2 */
data AU_trainees US_trainees;
   drop Country;
   infile 'sales1.dat';
   input  @1 Employee_ID 6.
         @21 Last_Name $18.
         @43 Job_Title $20.
         @64 Salary Dollar8.
         @73 Country $2.
         @87 Hire_Date mmddyy10.;
   if Job_Title = 'Sales Rep. I';
   if Country = 'AU' then output AU_trainees;
   else if Country = 'US' then output US_trainees;
run;

title 'Australian Trainees';
proc print data=AU_trainees noobs;
run;

title 'US Trainees';
proc print data=US_trainees noobs;
run;
title;


/* Exercise 3 */
data seminar_ratings;
   infile 'seminar.dat';
   input Name $15.  @'Rating:' Rating 1.;
run;

title 'Names and Ratings';
proc print data=seminar_ratings;
run;
title;



/* Exercise 4 */
data sales_staff2;
   infile 'sales2.dat'; 
   input  @1 Employee_ID 6.
         @21 Last_Name $18. /
          @1 Job_Title $20.
         @22 Hire_Date mmddyy10.
         @33 Salary dollar8. /;
run;

  /* Alternate Solution */
data sales_staff2;
   infile 'sales2.dat'; 
   input  @1 Employee_ID 6.
         @21 Last_Name $18.;
   input  @1 Job_Title $20.
         @22 Hire_Date mmddyy10.
         @33 Salary dollar8.;
   input;
run;

  /* Alternate Solution */
data sales_staff2;
   infile 'sales2.dat'; 
   input  @1 Employee_ID 6.
         @21 Last_Name $18. 
    #2    @1 Job_Title $20.
         @22 Hire_Date mmddyy10.
         @33 Salary dollar8.
    #3    ;
run;

title 'Australian and US Sales Staff';
proc print data=sales_staff2 noobs;
run;
title;



/* Exercise 5 */
data AU_sales US_sales;
   drop Country;
   infile 'sales3.dat';
   input  @1 Employee_ID 6.
         @21 Last_Name $18.
         @43 Job_Title $20.;
   input @10 Country $2. @;
   if Country = 'AU' then do;
      input @1 Salary dollarx8.
           @24 Hire_Date ddmmyy10.;
      output AU_sales;
   end;
   else if Country = 'US' then do;
      input @1 Salary dollar8.
           @24 Hire_Date mmddyy10.;
      output US_sales;
   end;    
run;

title 'Australian Sales Staff';
proc print data=AU_sales noobs;
run;

title 'US Sales Staff';
proc print data=US_sales noobs;
run;
title;


/***********************************
***      Unit 2-7 Exercises      ***
************************************/

libname orion 'D:\440\Unit2';


/* Exercise 1 */
  /* Part A */
data future_expenses;
   Wages=12874000;
   Retire=1765000;
   Medical=649000;
   start=year(today())+1;
   stop=start+9;
   do Year=start to stop;
      wages = wages * 1.06;
      retire=retire*1.014;
      medical=medical *1.095;
      Total_Cost=sum(wages,retire,medical);
      output;
   end;
   drop start stop;
run;

  /* Part B */
proc print data=future_expenses;
   var year wages retire medical total_cost;
   format wages retire medical total_cost comma14.2;
run;

  /* Alternate solution */
data future_expenses;
   Wages=12874000;
   Retire=1765000;
   Medical=649000;
   do Year=year(today())+1 to year(today())+10;
      wages = wages * 1.06;
      retire=retire*1.014;
      medical=medical *1.095;
      Total_Cost=sum(wages,retire,medical);
      output;
   end;
run;
proc print data=future_expenses;
   var year wages retire medical total_cost;
   format wages retire medical total_cost comma14.2;
run;

  /* Part C */
data income_expenses;
   Wages=12874000;
   Retire=1765000;
   Medical=649000;
   Income=50000000;
   Year=year(today())+1;
   do until (Total_Cost > Income);
      wages = wages * 1.06;
      retire=retire*1.014;
      medical=medical *1.095;
      Total_Cost=sum(wages,retire,medical);
      Income=Income *1.01;
      output;
      year+1;
   end;
run;
proc print data=income_expenses;
   var year income total_cost;
   format total_cost income comma14.2;
run;


/* Exercise 2 */
data expenses;
   Income= 50000000;
   Expenses = 38750000;
   do Year=1 to 30 until (Expenses > Income);
      income+(income * .01);
      expenses+(expenses * .02);
   end;
run;
proc print data=expenses;
   format income expenses dollar15.2; 
run;


/* Exercise 3 */
data expenses;
   Income= 50000000;
   Expenses = 38750000;
   do Year=1 to 75;
      income +(income * .01);
      expenses+(expenses * .02);
      if expenses > income then leave;
   end;
run;
proc print data=expenses;
   format income expenses dollar14.2; 
run;


/* Exercise 4 */
data discount_sales;
   set orion.orders_midyear;
   array mon{*} month1-month6;
   do i=1 to 6;
      mon{i} = mon{i} *.95;
   end;
   drop i;
run;

title 'Monthly Sales with 5% Discount';
proc print data=discount_sales noobs;
   format month1-month6 dollar10.2;
run;
title;


/* Exercise 5 */
data special_offer;
   set orion.orders_midyear;
   array mon{*} month1-month3;
   Total_Sales=sum(of month1-month6);
   do i=1 to 3;
      mon{i} = mon{i} *.90;
   end;
   Projected_Sales=sum(of month1-month6);
   Difference=Total_Sales-Projected_Sales;
   keep Total_Sales Projected_Sales Difference;
run;

options nodate nonumber;
title 'Total Sales with 10% Discount in First Three Months';
proc print data=special_offer noobs;
   sum difference;
   format total_sales projected_sales difference dollar10.2;
run;
title;



/* Exercise 6 */
 /* Part A */

data fsp;
   set orion.orders_midyear;
   keep Customer_ID Months_Ordered Total_Order_Amount;
   array amt{*} month:;
   if dim(amt) < 3 then do;
      put 'Insufficient data for Frequent Shopper Program';
      stop;
   end;
   Total_Order_Amount=0;
   Months_Ordered=0;
   do i=1 to dim(amt);
      if amt{i} ne . then Months_Ordered+1;
      Total_Order_Amount+amt{i};
   end;
   if Total_Order_Amount>1000 and Months_Ordered >= (dim(amt))/2;
run;

  /* Part B */
title 'orion.orders_midyear: Frequent Shoppers ';
proc print data=fsp;
   format total_order_amount dollar10.2;
run;
title;

 /* Part C */
data fsp;
   set orion.orders_qtr1;
   keep Customer_ID Months_Ordered Total_Order_Amount;
   array amt{*} month:;
   if dim(amt) < 3 then do;
      put 'Insufficient data for Frequent Shopper Program';
      stop;
   end;
   Total_Order_Amount=0;
   Months_Ordered=0;
   do i=1 to dim(amt);
      if amt{i} ne . then Months_Ordered+1;
      Total_Order_Amount+amt{i};
   end;
   if Total_Order_Amount>1000 and Months_Ordered >= (dim(amt))/2;
run;

title 'orion.orders_qtr1: Frequent Shoppers ';
proc print data=fsp;
   format total_order_amount dollar10.2;
run;
title;

 /* Part D */
data fsp;
   set orion.orders_two_months;
   array amt{*} month:;
   if dim(amt) < 3 then do;
      put 'Insufficient data for Frequent Shopper Program';
      stop;
   end;
   Total_Order_Amount=0;
   Months_Ordered=0;
   do i=1 to dim(amt);
      if amt{i} ne . then Months_Ordered+1;
      Total_Order_Amount+amt{i};
   end;
   if Total_Order_Amount>1000 and Months_Ordered >= (dim(amt))/2;
   keep Customer_ID Months_Ordered Total_Order_Amount;
run;

title 'orion.orders_two_months: Frequent Shoppers ';
proc print data=fsp;
   format total_order_amount dollar10.2;
run;
title;


/* Exercise 7 */
data preferred_cust;
   set orion.orders_midyear;
   array Mon{6} Month1-Month6;
   array Over{6};
   array Target{6} _temporary_ (200,400,300,100,100,200);
   do i=1 to 6;
      if Mon{i} > Target{i} then
         Over{i} = Mon{i} - Target{i};
   end;
   Total_Over=sum(of Over{*});
   if Total_Over > 500;
   keep Customer_ID Over1-Over6 Total_Over;
run;
proc print data=preferred_cust noobs;
run;


/* Exercise 8 */
data passed failed; 
   set orion.test_answers;   
   array Response{10} Q1-Q10;   
   array Answer{10} $ 1 _temporary_ ('A','C','C','B','E',
                                    'E','D','B','B','A');
   Score=0;
   do i=1 to 10;
      if Answer{i}=Response{i} then Score+1;
   end; 
   if Score ge 7 then output passed;
   else output failed;
   drop i;
run;

title 'Passed';
proc print data=passed;
run;
title;

title 'Failed';
proc print data=failed;
run;
title;

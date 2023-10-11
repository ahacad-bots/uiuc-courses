/********************************
***   Homework 10 Solutions   ***
********************************/

option nodate pageno=1 center ls=96 ;
ods rtf file='C:\440\hw10\hw10 solution Sp17.rtf';
libname hw10 'C:\Users\dunger\Box Sync\- STAT 440 -\homework\data';

title 'Homework 10 Report';


/* Exercise 1 */
/*a*/
data mostmoney;
   input Option :$1. Deposit :dollar5.
         Rate :percent5. Freq :$9. Times;
   Total=0;
   do i = 1 to 25;
      Total + Deposit;
	  do j = 1 to Times;
	     Total + (Total * Rate/Times);
      end;
   end;
   drop i j;
   format Deposit Total dollar8.0
          Rate percent8.2;
   label Deposit='Yearly Deposit'
         Rate='Interest Rate'
		 Freq='Compound Frequency'
		 Times='Times per Year'
         Total='Total after 25 years';
   datalines;
A	$1000	8.00%	Yearly		1
B	$1700	4.00%	Quarterly	4
C	$1900	3.00%	Quarterly	4
D	$2300	2.50%	Monthly		12
E	$2500	1.25%	Monthly		12
F	$2700	1.00%	Weekly		52
;
run;

/*b*/
title2 'Part 1b';
title3 'Data Portion of MOSTMONEY';
proc print data=mostmoney noobs label;
run;

/* Alternate solution */
/*
proc sort data=mostmoney out=mostsort;
   by descending Total;
run;
proc print data=mostsort noobs label;
run;
*/

/*c*/
data save30;
   input Option :$1. Deposit :dollar5.
         Rate :percent5. Freq :$9. Times;
   Amount=0;
   Years=0;
   do i = 1 to 25 until (Amount >= 30000);
   /* or...       while (Amount <  30000)  */
      Amount + Deposit;
	  Years+1;
	  do j = 1 to Times;
	     Amount + (Amount * Rate/Times);
      end;
   end;
   keep Option Amount Years;
   format Amount dollar8.0;
   label Amount='Amount Earned'
         Years='Years until $30K';
   datalines;
A	$1000	8.00%	Yearly		1
B	$1700	4.00%	Quarterly	4
C	$1900	3.00%	Quarterly	4
D	$2300	2.50%	Monthly		12
E	$2500	1.25%	Monthly		12
F	$2700	1.00%	Weekly		52
;
run;

/*d*/
title2 'Part 1d';
title3 'Data Portion of SAVE30K';
proc print data=save30 noobs label;
run;



/* Exercise 2 */
/*a*/
data hw10.chicago;
   length Weekday $ 9;
   infile 'chicago_avg_temps 12-16.txt';
   retain Date '01JAN2012'd;
   do Weekday = 'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday';
      input Temp @;
      output;
	  Date + 1;
   end;
   format Date worddate.;
   label Temp='Average Temperature';
run;

/* Alternate solution */
/*
data hw10.chicago;
   infile 'chicago_avg_temps 12-16.txt';
   retain Date '01JAN2012'd;
   do i = 1 to 7;
      input Temp @;
	  Weekday = put(Date, downame.);
      output;
	  Date + 1;
   end;
   drop i;
   format Date worddate.;
   label Temp='Average Temperature';
run;
*/

/* b */
title2 'Part 2b';
title3 'Chicago Average Temperatures';
title4 'from April 2016';
proc print data=hw10.chicago noobs label;
   var Weekday Date Temp;
   where month(Date)=4 and year(Date)=2016;
   /* or...
   where Date between '01APR2016'd and '30APR2016'd; */
run;

/* c */
data hw10.hotdays;
   infile 'hourly_temps.txt';
   do Day = 1, 2;
      do Hour = 1 to 24;
         input Temp @;
         output;
      end;
   end;
   label Temp='Hourly Temperature';
run;

/* d */
title2 'Part 2d';
title3 'Chicago Hourly Temperatures';
title4 'on Two Days in 2013';
proc means data=hw10.hotdays maxdec=1
           n median mean std;
   /* Using a BY statement instead of the CLASS statement
	  will achieve similar output in this case. */
   class Day;  
   var Temp;
run;


title;
ods rtf close;

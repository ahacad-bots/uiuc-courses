/*******************************
***   Homework 8 Solutions   ***
*******************************/

option nodate pageno=1 center ls=96 ;
ods rtf file='C:\440\hw8\hw8 solution Sp17.rtf';
libname hw8 'C:\440\hw8';

title 'Homework 8 Report';

/* Exercise 1 */
/* a */
proc sort data=hw8.orders out=work.orders;
  by Customer_ID Order_Type;
run;

data discount_ret (keep=Customer_ID Customer_Name TotSales)
     discount_cat (keep=Customer_ID Customer_Name TotSales Customer_Gender)
     discount_int (keep=Customer_ID Customer_Name TotSales Customer_BirthDate);
   set work.orders;
   by Customer_ID Order_Type;
   if first.Order_Type then TotSales=0;
   TotSales+Total_Retail_Price;
   if last.Order_Type and 
      (TotSales >= 400 or (TotSales >= 75 and Order_Type = 2)) then	
	  select (Order_Type);
         when (1) output discount_ret;
	     when (2) output discount_cat;
	     when (3) output discount_int;
	  end;
run;

/* b */
title2 'Part 1b';
title4 'Customers Spending $400 or more in Retail Sales';
proc print data=discount_ret noobs label;
   format TotSales dollar11.2;
run;

title4 'Customers Spending $75 or more in Catalog Sales';
proc print data=discount_cat noobs label;
   format TotSales dollar11.2;
run;

title4 'Customers Spending $400 or more in Internet Sales';
proc print data=discount_int noobs label;
   format TotSales dollar11.2;
run;


/* c */
proc sort data=hw8.orders out=work.orders;
  by Customer_ID Order_Type;
run;

data discount_ret (keep=Customer_ID Customer_Name TotSales)
     discount_cat (keep=Customer_ID Customer_Name TotSales Customer_Gender)
     discount_int (keep=Customer_ID Customer_Name TotSales Customer_BirthDate)
	 top_buyers (keep=Customer_ID Customer_Name CusSales);
   set work.orders;
   by Customer_ID Order_Type;

   if first.Customer_ID then CusSales=0;
   if first.Order_Type then TotSales=0;

   TotSales+Total_Retail_Price;
   CusSales+Total_Retail_Price;

   if last.Order_Type and 
      (TotSales >= 400 or (TotSales >= 75 and Order_Type = 2)) then	
	  select (Order_Type);
         when (1) output discount_ret;
	     when (2) output discount_cat;
	     when (3) output discount_int;
	  end;
   if last.Customer_ID and CusSales > 500 then output top_buyers;
run;

/* d */
title2 'Part 1d';
title4 'Customers Spending $400 or more in Internet Sales';
proc print data=discount_int noobs label;
   format TotSales dollar11.2;
run;

title4 'Customers Spending more than $500 Total';
proc print data=top_buyers noobs label;
   format CusSales dollar11.2;
run;



/* Exercise 2 */
/* a */
data trade;
   infile 'C:\440\hw8\importexport87-15.dat' dlm='09'x;
   input Date :mmddyy. Export Import @@;
   Balance = Export - Import;
   format Date mmddyy10.  
          Export Import Balance dollar10.0;
run;

/* b */
title2 'Part 2b';
title4 'Data Portion of TRADE';
title5 '(values measured in millions of dollars)';
proc print data=trade(obs=24) noobs label;
run;


/* c */
/* This solution uses the data set from part a and utilizes
   the Date variable to identify the first and last observations
   in each Year. */
/* As noted in the output from part (b), the trade data set is not
   sorted.  */
proc sort data=trade out=temp1;
   by Date;
run;
data yearlyimports;
   set temp1;
   retain Year;
   if year(Date) ne Year then do;
      Year=year(Date);
      YearTotal=0;
   end;
   YearTotal+Import;
   if month(Date)=12 then do;
      YearAvg = YearTotal/12;
      output;
   end; 
   keep Year YearTotal YearAvg;
   format YearTotal YearAvg dollar10.0;
   label YearTotal='Yearly Total#of Exports'
         YearAvg='Monthly Average#of Exports';
run;

/* This solution is less efficient. Even though it uses 
   First.BY and Last.BY, it requires that the Year variable 
   be created in a previous DATA step before sorting and the 
   accumulating variable DATA step can run. */
/*
data temp1;
   infile 'C:\440\hw8\importexport87-15.dat' dlm='09'x;
   input Date :mmddyy. Export Import @@;
   Year = year(Date);
   format Date mmddyy10.  
          Export Import dollar10.0;
run;
proc sort data=temp1 out=temp2;
   by Year;
run;
data yearlyimports;
   set temp2;
   by Year;
   if first.Year then YearTotal=0;
   YearTotal+Import;
   if last.Year then do;
      YearAvg = YearTotal/12;
      output;
   end; 
   keep Year YearTotal YearAvg;
   format YearTotal YearAvg dollar10.0;
   label YearTotal='Yearly Total#of Exports'
         YearAvg='Monthly Average#of Exports';
run;
*/

/* d */
title2 'Part 2d';
proc contents data=yearlyimports;
run;

/* e */
title2 'Part 2e';
proc print data=yearlyimports noobs split='#';
   var Year YearTotal YearAvg;
run;

/* f */
/* Writing a new DATA step and creating a new variable
   called Decade is not as efficient as a FORMAT. */
proc format;
   value decade 1980-<1990 = "80's"
                1990-<2000 = "90's"
				2000-<2010 = "00's"
				2010-<2020 = "10's";
run;

title2 'Part 2f';
title4 'Average Value of Imports per Year';
title5 '(values measured in millions of dollars)';

/* Simplest solution that most will use... */
/*
proc means data=yearlyimports nonobs n mean maxdec=0;
   class Year;
   var YearTotal;
   format Year decade.;
   label Year='Decade'
         YearTotal='Yearly Total of Exports';
run;
*/

/* Alternate solution using PROC TABULATE to format the 
   yearly averages. 
   This is what appears in solution. */
proc tabulate data=yearlyimports;
   class Year;
   var YearTotal;
   table Year, YearTotal*(n mean*f=dollar10.0);
   format Year decade.;
   label Year='Decade'
         YearTotal='Yearly Total of Exports';
run;


ods rtf close;
title;

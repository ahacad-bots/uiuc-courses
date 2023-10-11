/***********************************
***      Unit 2-5 Exercises      ***
************************************/

libname orion 'D:\440\Unit2';


/* Exercise 1 */
/* a */
data work.codes;
   set orion.au_salesforce;
   length FCode1 FCode2 $ 1 LCode $ 4;
   FCode1=lowcase(substr(First_Name,1,1));
   FCode2=lowcase(substr(First_Name,length(First_Name),1));
   LCode=lowcase(substr(Last_Name,1,4));
run;

/* b */
title 'Extracted Letters for User IDs';
proc print data=work.codes;
   var First_Name FCode1 FCode2 Last_Name LCode;
run;
title;

  /* Alternate Solution */
data work.codes;
   set orion.au_salesforce;
   length FCode1 FCode2 $ 1 LCode $ 4;
   FCode1=lowcase(substr(First_Name,1,1));
   FCode2=lowcase(substr(right(First_Name),12,1));
   /* Note that 12 is the variable length of First_Name */
   LCode=lowcase(substr(Last_Name,1,4));
run;
title 'Extracted Letters for User IDs';
proc print data=work.codes;
   var First_Name FCode1 FCode2 Last_Name LCode;
run;
title;


/* Exercise 2 */
/* a */
data work.small;
   set orion.newcompetitors;
   Country = substr(ID,1,2);
   Store_Code=left(substr(ID,3));
   if substr(Store_Code,1,1) = '1';
   City=propcase(City);
run;

/* b */
title 'New Small-Store Competitors';
proc print data=work.small noobs;
    var Store_Code Country City Postal_Code;
run;
title; 


/* Exercise 3 */
/* a */
data states;
   set orion.contacts;
   keep ID Name Location;
   Location = zipnamel(substr(right(address2),20,5));
run;

/* b */
proc print data=states noobs;
run;


/* Exercise 4 */
/* a */
data names;
   length New_Name $50 
          FMnames $30
          Last $30;
   set orion.customers_ex5;
   FMnames = scan(Name,2,',');
   Last = propcase(scan(Name,1,','));
   if Gender="F" then New_Name=CATX(' ','Ms.',FMNames,Last);
   else if Gender="M" then New_Name=CATX(' ','Mr.',FMNames,Last);
   keep New_Name Name Gender;
run;

/* b */
proc print data=names;
run;


/* Exercise 5 */
/* a */
data work.silver work.gold work.platinum;
   set orion.customers_ex5;
   Customer_ID=tranwrd(Customer_ID,'-00-','-15-');
   if find(Customer_ID,'Silver','I') > 0 then
	  output work.silver;
   else if find(Customer_ID,'Gold','I') > 0 then
	  output work.gold;
   else if find(Customer_ID,'Platinum','I') > 0 then
	  output work.platinum;
   keep Name Customer_ID Country; 
run;

/* b,c  */
title 'Silver-Level Customers';
proc print data=work.silver noobs;
run;

title 'Gold-Level Customers';
proc print data=work.gold noobs;
run;

title 'Platinum-Level Customers';
proc print data=work.platinum noobs;
run;
title;


/* Exercise 6 */
/* a */
data work.split;
   set orion.employee_donations (obs=10);
   PctLoc=find(Recipients,'%');
   /* Position in which the first '%' occurs */
   if PctLoc > 0 then do;
      Charity=substr(Recipients,1,PctLoc);
      output;
      Charity=substr(Recipients,PctLoc+3);
      output;
   end;
   /* If '%' was found, then there's more than one recipient */
   /* Use PctLoc+3 for the '%, ' before the second charity */
   else do;
      Charity=trim(Recipients)!!' 100%';
      output;
   end;
   drop PctLoc Recipients;
run;

proc print data=work.split noobs;
   var Employee_ID Charity;
run;

/* b */
data work.split;
   set orion.employee_donations;
   PctLoc=find(Recipients,'%');
   /* Position in which the first '%' occurs */
   if PctLoc > 0 then do;
      Charity=substr(Recipients,1,PctLoc);
      output;
      Charity=substr(Recipients,PctLoc+3);
      output;
   end;
   /* If '%' was found, then there's more than one recipient */
   /* Use PctLoc+3 for the '%, ' before the second charity */
   else do;
      Charity=trim(Recipients)!!' 100%';
      output;
   end;
   drop PctLoc Recipients;
run;

title 'Charity Contributions for each Employee';
proc print data=work.split noobs;
   var Employee_ID Charity;
run;
title;

  /* Alternate Solution */
  /* Use SCAN with '%' as a delimiter */
data work.split;
   set orion.employee_donations;
   PctLoc=find(Recipients,'%');
   /* Position in which the first '%' occurs */
   if PctLoc > 0 then do;
      Charity=scan(Recipients,1,'%')!!'%';
      output;
      Charity=substr(scan(Recipients,2,'%')!!'%',3);
      output;
   end;
   /* Because '%' is the delimiter, we must concatenate
      a '%' to the character string after the SCAN */
   else do;
      Charity=trim(Recipients)!!' 100%';
      output;
   end;
   drop PctLoc Recipients ;
run;

title 'Charity Contributions for each Employee';
proc print data=work.split noobs;
   var Employee_ID Charity;
run;
title;


/* Exercise 7 */
/* a */
data work.supplier;
   length Supplier_ID $ 5 Supplier_Name $ 30 Country $ 2;
   infile 'supply.dat';
   input Supplier_ID $;
   Country=scan(_INFILE_,-1,' ');
   StartCol=find(_INFILE_,' ');
   EndCol=find(_INFILE_,' ',-999);
   /* Everything between these first and last blanks is
   the supplier name. */
   Supplier_Name=substr(_INFILE_,StartCol+1,EndCol-StartCol);
   /* Knowing where the last blank is, Country could have 
   also been created using SUBSTR. */
   drop StartCol EndCol;
run;

/* b */
title 'Supplier Information';
proc print data=work.supplier noobs;
run;
title;


/* Exercise 8 */
/* a */
data work.sale_stats;
   set orion.orders_midyear;
   MonthAvg=round(mean(of month1-month6));
   MonthMax=max(of month1-month6);
   MonthSum=sum(of month1-month6);
run;

/* b */
title 'Statistics on Months in which the Customer Placed an Order';
proc print data=work.sale_stats noobs;
   var Customer_ID MonthAvg MonthMax MonthSum;
run;
title;


/* Exercise 9 */
/* a */
data work.freqcustomers;
   set orion.orders_midyear;
   if n(of month1-month6) >= 5;
   /* Alternative: if nmiss(of month1-month6) <= 1; */
   Month_Median=median(of month1-month6);
   Month_Highest=largest(1,of month1-month6);
   Month_2ndHighest=largest(2,of month1-month6);
run;

/* b */
title 'Month Statistics on Frequent Customers';
proc print data=work.freqcustomers noobs;
run;
title;


/* Exercise 10 */
data shipping_notes;
  set orion.shipped;
  length Comment $ 21;
  Comment = cat('Shipped on ',put(Ship_Date,mmddyy10.));
  Total = Quantity * input(Price,comma7.2);
run;

proc print data=shipping_notes noobs;
  format Total dollar7.2;
run;


/* Exercise 11 */
/* a */
data US_converted (drop=cID nTelephone cBirthday);
   set orion.US_newhire (rename=(ID=cID Telephone=nTelephone
                                 Birthday=cBirthday));
   ID = input(compress(cID,'-'),15.);
   length Telephone $ 8;
   Telephone = cat(substr(put(nTelephone,7.),1,3),
               '-',substr(put(nTelephone,7.),4));
   Birthday = input(cBirthday,date9.);
run;

/* b */
title 'US New Hires';
proc print data=US_converted noobs;
run;
title;

proc contents data=US_converted varnum;
run;

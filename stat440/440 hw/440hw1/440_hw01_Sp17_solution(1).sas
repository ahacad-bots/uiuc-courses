/*******************************
***   Homework 1 Solutions   ***
*******************************/

option nodate pageno=1 center ls=96 ;
ods pdf file='C:\440\hw01\hw01 solution Sp17.pdf';
libname hw01 'C:\440\hw01';

title 'Homework 1 Report';

/* Exercise 1 */
/*a*/
title2 'Part 1a';
proc contents data=sashelp.pricedata;
run;

/*b*/
data pricing;
   set sashelp.pricedata;
   where Sale > 300 and Price-Cost < 40;
   keep Date Sale Price Discount Cost ProductName;
   format Date mmddyy10. 
          Price Cost dollar7.2
          Discount percent6.0;
   label Sale="Units Sold";
run;

/*c*/
title2 'Part 1c';
proc contents data=pricing;
run;

/*d*/
title2 'Part 1d';
proc print data=pricing label;
run;



/* Exercise 2 */
/*a*/
title2 'Part 2a';
proc contents data=hw01.employee_roster;
run;

/*b*/
data top_earners;
   set hw01.employee_roster;
   where Salary > 70000;
   label Job_Title="Position"
         Salary="Yearly Salary";
   format Salary dollar8.;
run;

/*c*/
title2 'Part 2c';
proc print data=top_earners label;
   var Employee_Name Job_Title Salary;
run;

/*d*/
title2 'Part 2d';
proc print data=hw01.employee_roster label;
   where Employee_Gender = "M" and
   		 Section="Administration" and
         Salary between 25000 and 30000; /* OR... 25000 <= Salary <= 30000 */
   var Employee_Name Employee_Gender Section Salary;
   format Salary dollar8.;
run;

/*e*/
title2 'Part 2e';
proc print data=hw01.employee_roster label;
   where "C" <= Employee_Name < "F";
   /* other efficient options include...
   where Employee_Name between "C" and "E~";

   /* one that I wouldn't expect of you yet...
   where char(Employee_Name,1) in ("C" "D" "E");

   /* a less efficient option that also works is...
   where Employee_Name like "C%" or 
         Employee_Name like "D%" or 
		 Employee_Name like "E%";
   */
   var Employee_Name Employee_ID Org_Group;
run;


title;
ods pdf close;

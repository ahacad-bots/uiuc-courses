*** s108d09e ***;

options symbolgen;
%include "s108d09a.sas" /source2; /** Windows and Unix */
*%include ".WORKSHOP.SASCODE(s108D09A)"  /source2; /* z/OS mainframe */

%let tablename=WORK.PAYROLL;

proc sql noprint;
select Name
   into :Column_Names separated by ","
   from dictionary.Columns
   where libname ="%scan(&tablename,1)"
   and memname="%scan(&tablename,2)"
   and upcase(Name) like '%DATE%';
reset print;
title "Dates of Interest by Employee_ID";
title2 "&tablename SAS Data";
select Employee_ID, &Column_Names
   from &tablename
   order by Employee_ID;
quit;


options nosymbolgen;

/**************************************************************
Open program s108d09e 

Discuss the addition of the %LET statement with the TABLE NAME specified 

DISCUSS HOW YOU CAN MAKE THE PROGRAM more general by using &TABLENAME pulled 
apart with the %SCAN function, they have seen SCAN in this course, so %SCAN is 
a macro function that does the same thing for simplicity sake.  To learn more, 
take the macro class. 

These TABLENAME values can demo the flexibilty of this program:

ORION.SALES
ORION.SALESSTAFF
ORION.STAFF
ORION.QTR2_2007
WORK.PAYROLL (IF YOU CREATED A WORKING COPY OF ORION.EMPLOYEE_PAYROLL)
**************************************************************/


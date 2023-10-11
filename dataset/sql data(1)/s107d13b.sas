*** s107d13b ***;
libname test "./test"; /* Windows and UNIX */
*libname TEST  '.WORKSHOP.TEST'; /* z/OS mainframe */
proc sql;
   create view test.Level_II as
      select Employee_ID, Gender, 
             Job_Title as Title
         from orion.Staff
         where scan(Job_Title,-1) ='II'
        	   and Emp_Term_Date is missing
		 using libname orion '.'
  /*		 using libname orion '.WORKSHOP.SASDATA' */
;
   select * 
      from test.Level_II;
quit;
libname orion clear;
proc sql;
   select * 
      from test.Level_II;
quit;
libname test clear;
libname orion '.'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* z/OS mainframe */

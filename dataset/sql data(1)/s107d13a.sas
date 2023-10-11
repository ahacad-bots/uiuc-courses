*** s107d13a ***;
libname test '.'; /*Windows and UNIX */
*libname test  '.WORKSHOP.SASDATA'; /* z/OS mainframe */
proc sql;
   create view test.Level_II as
      select Employee_ID, Gender, 
             Job_Title as Title
         from Staff
         where scan(Job_Title,-1) ='II'
		       and Emp_Term_Date is missing
;
   select * 
      from test.Level_II;
quit;
libname test clear;
proc sql;
   select * 
      from orion.Level_II;
quit;
libname test "./test"; /*Windows and UNIX */
*libname TEST  '.WORKSHOP.TEST'; /* z/OS mainframe */
proc datasets library=orion nolist;
   copy out=test;
   select Level_II;
run;
quit;
proc sql;
   select * 
      from test.Level_II;
quit;
proc datasets library=test nolist kill;
run;
proc sql;
   drop view orion.Level_II;
quit;
libname test clear;

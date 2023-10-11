*** s107d12 ***;
libname orion "."; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* z/OS mainframe */
proc sql;
   select * 
      from orion.Level_II;
quit;

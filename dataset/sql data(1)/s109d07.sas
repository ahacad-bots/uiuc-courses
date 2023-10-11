*** s109d07 ***;

proc sql;
   drop index Locale
      on work.Employee_addresses
   ;
quit;

proc sql;
   drop table work.Employee_addresses
   ;
quit;

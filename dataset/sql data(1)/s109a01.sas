*** s109a01 ***;

options msglevel=i;
proc sort data=orion.Employee_addresses 
           out=work.Employee_addresses;
	by City State Country Employee_Name;
run;

proc sql;
   create index Locale
      on work.Employee_addresses 
         (City, State, Country)
   ;
quit;

proc sql flow=7 25;
   select Employee_Name, City, State, Country
      from work.Employee_addresses
      where City in ('Philadelphia','San Diego')
   ;
   select Employee_Name, City, State, Country
      from work.Employee_addresses
      where Country = 'US'
   ;
   select Employee_Name, City, State, Country
      from work.Employee_addresses
      where City in ('Philadelphia','San Diego')
            and Country = 'US'
   ;
quit;
options msglevel=n;

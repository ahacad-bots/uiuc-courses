*** s109d01 ***;

proc sort data=orion.Employee_addresses 
          out=work.Employee_addresses;
	by City State Country Employee_Name;
run;

proc sql;
   create unique index Employee_ID
      on work.Employee_addresses       
         (Employee_ID)
   ;
quit;

proc sql;
   create index Locale 
      on work.Employee_addresses 
         (City, State, Country)
   ;
quit;

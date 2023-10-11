*** s104d04a ***;

proc sql;
   select catx(' ',First_name,Last_name)
          format=$25. as Name
      from orion.Sales
      where First_name="John"
;
quit;
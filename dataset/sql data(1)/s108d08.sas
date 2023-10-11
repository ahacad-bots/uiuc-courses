*** s108d08 ***;  

proc sql;
  /* First execute the query once to set the value of SQLOBS */
   select substr(put(Customer_Type_ID,4.),1,1) 
          as Tier, Count(*)
      from orion.Customer
      group by Tier
;
%let Rows=&SQLOBS;
%put NOTE:  There are &Rows Tiers;
reset noprint;
   select substr(put(Customer_Type_ID,4.),1,1) 
          as Tier, Count(*)
          into :Tier1-:Tier&Rows,:Count1-:Count&Rows
      from orion.Customer
      group by Tier
;
%put NOTE: Tier1 is &tier1  Count1 is: &count1;
%put NOTE: Tier2 is &tier2  Count2 is: &count2;
%put NOTE: Tier3 is &tier3  Count3 is: &count3;

reset print;
title "Tier &Tier1 Customers (&Count1 total)";
   select Customer_Name, Country
      from orion.Customer
	  where substr(put(Customer_Type_ID,4.),1,1) ="&Tier1"
	  order by country, Customer_Name
;
title "Tier &Tier2 Customers (&Count2 total)";
   select Customer_Name, Country
      from orion.Customer
	  where substr(put(Customer_Type_ID,4.),1,1) ="&Tier2"
	  order by country, Customer_Name
;
title "Tier &Tier3 Customers (&Count3 total)";
   select Customer_Name, Country
      from orion.Customer
      where substr(put(Customer_Type_ID,4.),1,1) ="&Tier3"
	  order by country, Customer_Name
;
quit;

*** s102s05 ***;
proc sql; 
title 'Donations Exceeding $90.00 in 2007';
   select Employee_ID,  Recipients,  
          sum(Qtr1,Qtr2,Qtr3,Qtr4) as Total
      from orion.Employee_Donations
      where calculated Total > 90;    
quit;
title;
 

*** s106d04 ***;                                                                                                                
                                                                                                                                        
proc sql;                                                                                                                             
title 'Non-Sales Staff Employees';
   select Employee_ID, Job_Title                                                                                                        
      from orion.Employee_organization                                                                                                
   except all                                                                                                                             
   select Employee_ID, Job_Title                                                                                                        
      from orion.Sales;                                                                                                               
quit;                                                                                                                                   

title;


*** s106d05 ***;
         
proc sql;                                                                                                                               
   select count(*) 'No. Non-Sales Managers'
      from (select distinct Manager_ID                                                                                                          
               from orion.Employee_organization                                                                                                 
            except all                                                                                                                          
            select Employee_ID                                                                                                                   
               from orion.Sales)                                                                                                                
   ;                                                                                                                                       
quit;                                                                                                                                   
                                                                                                                                       

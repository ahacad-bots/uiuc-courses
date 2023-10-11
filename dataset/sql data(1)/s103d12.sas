*** s103d12 ***;

proc sql;
   select Department,  Job_Title,
          (find(Job_Title,"manager","i") >0) 
          "Manager" 
      from orion.Employee_Organization
;
quit;

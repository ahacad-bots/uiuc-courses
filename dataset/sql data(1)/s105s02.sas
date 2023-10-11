 *** s105s02 ***;

proc sql;
   select Employee_Name 'Name' format=$35., 
          City, Job_Title
      from orion.Employee_Addresses as a
      	   left join 
           orion.Sales as s
	  on a.Employee_ID=s.Employee_ID
	  order by City, Job_Title, Employee_Name
;
quit;

*** s106d08 ***;

proc sql;
   select Employee_ID
      from orion.Sales
	  where year(Hire_date)=2004
		    and scan(Job_Title,-1) in 
            ("III","IV")
   intersect all
   select distinct Employee_ID
      from orion.Order_fact
	  where year(Order_date) le 2005
;
quit;

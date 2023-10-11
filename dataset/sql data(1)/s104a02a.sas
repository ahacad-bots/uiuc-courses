*** s104a02a ***;

proc sql;
select Employee_ID, Job_Title
  from orion.Sales
  where not exists
    (select *
	 from orion.Order_fact
     where Employee_ID=Employee_ID);
quit;




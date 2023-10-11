*** s104d06 ***;

proc sql;
select Employee_ID, Job_Title
  from orion.Sales
  where not exists
    (select *
	 from orion.Order_fact
     where Sales.Employee_ID=
	       Order_fact.Employee_ID);
quit;

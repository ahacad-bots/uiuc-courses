*** s105d17 ***;

proc sql;
   select Employee_Name format=$25. as Name
          , City
      from orion.Employee_Addresses
      where Employee_ID in
	      /* Subquery - List managers' Employee_IDs */
	     (select Manager_ID 
             from orion.Employee_Organization as o,
		     	/* In-line View - Employees who sold 
			       Expedition Zero mechandise */
                (select distinct Employee_ID
                    from orion.Order_Fact as o, 
	                     orion.Product_Dim as p
                    where o.Product_ID=p.Product_ID
                          and year(Order_Date)=2003 
                          and Product_Name contains 'Expedition Zero' 
                          and Employee_ID ne 99999999) as ID
                           /* End In-line View */  
             where o.Employee_ID=ID.Employee_ID)
		     /* End Subquery */
;
quit;

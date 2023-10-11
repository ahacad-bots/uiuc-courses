*** s105d18 ***;

proc sql;
   select distinct catx(' ',scan(Employee_Name,2,','), 
          scan(Employee_Name,1,',')) format=$25.
          as Manager,City
      from orion.Order_Fact as of,  
           orion.Product_Dim as pd,
           orion.Employee_Organization as eo,
           orion.Employee_Addresses as ea
      where of.Product_ID=pd.Product_ID
            and of.Employee_ID=eo.Employee_ID
            and ea.Employee_ID=eo.Manager_ID 
            and Product_Name contains 'Expedition Zero' 
            and year(Order_Date)=2003
            and eo.Employee_ID ne 99999999  
;
quit;


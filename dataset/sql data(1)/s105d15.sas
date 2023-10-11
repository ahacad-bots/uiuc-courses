*** s105d15 ***;

proc sql;
   select distinct Employee_ID
      from orion.Order_Fact as o, 
           orion.Product_Dim as p
      where o.Product_ID=p.Product_ID
            and year(Order_Date)=2003
            and Product_Name contains 'Expedition Zero' 
            and Employee_ID ne 99999999
;
quit;

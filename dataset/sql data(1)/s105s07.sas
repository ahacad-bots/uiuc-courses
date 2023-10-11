*** s105s07 ***;

proc sql;
title "2007 Total Sales Figures";
   select catx(' ',scan(mgr.Employee_Name,2,','), 
               scan(mgr.Employee_Name,1,',')) format=$27. 
          as Manager,
          catx(' ',scan(emp.Employee_Name,2,','), 
               scan(emp.Employee_Name,1,',')) format=$27. 
          as Employee,
          Sum(Total_Retail_Price) format=comma9.2
          as Total_Sales 
      from orion.Order_Fact as order,  
           orion.Employee_Organization as org,
           orion.Employee_Addresses as emp,
           orion.Employee_Addresses as mgr
      where order.Employee_ID=org.Employee_ID
        and order.Employee_ID=emp.Employee_ID
        and mgr.Employee_ID=org.Manager_ID 
        and year(Order_Date)=2007
        and order.Employee_ID ne 99999999
      group by mgr.Country, mgr.Employee_Name, emp.Employee_Name
      order by mgr.Country, mgr.Employee_Name, Total_Sales desc
;
quit;
title;

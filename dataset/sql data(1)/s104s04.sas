 *** s104s04 ***;

 /* a */
proc sql;
title "Employee With The Highest Total Sales";
   select Employee_ID, 
          sum(Total_Retail_Price*quantity) as Total_Sales 
          format=dollar12.2
      from orion.Order_Fact
      where Employee_ID ne 99999999
      group by Employee_ID
      having Total_Sales = 
        (select max(Total_Sales) 
            from (select sum(Total_retail_price*quantity)
                         as Total_Sales
                     from orion.Order_Fact
                     where Employee_ID ne 99999999
                     group by Employee_Id))
   ;
quit;
title;



  /* b */
proc sql;
title "Name Of The Employee With The Highest Sales";
   select Employee_ID, Employee_Name
      from orion.Employee_Addresses
      where Employee_ID=
        (select Employee_ID
            from orion.Order_Fact
            where Employee_ID ne 99999999
            group by Employee_ID
            having  sum(Total_Retail_Price*quantity) = 
              (select max(Total_Sales) 
                  from (select sum(Total_retail_price*quantity)
                               as Total_Sales
                           from orion.Order_Fact
                           where Employee_ID ne 99999999
                           group by Employee_Id)))
   ;
quit;
title;

/* c */
proc sql;
title "Employee with the Highest Sales";
   select E.Employee_ID label='Employee Identification Number',
          Employee_Name label='Employee Name',
          Total_Sales format=dollar12.2 label='Total Sales'
      from orion.Employee_Addresses as E,
         (select Employee_ID, 
                 sum(Total_Retail_Price*quantity) as 
                 Total_Sales format=dollar12.2
             from orion.Order_Fact
             where Employee_ID ne 99999999
             group by Employee_ID
             having Total_Sales = 
               (select max(Total_Sales) 
                   from (select sum(Total_retail_price*quantity) 
                                 as Total_Sales
                            from orion.Order_Fact
                            where Employee_ID ne 99999999
                            group by Employee_Id
                         )
                )
          ) as O
      where E.Employee_ID=O.Employee_ID
   ;
quit;
title;

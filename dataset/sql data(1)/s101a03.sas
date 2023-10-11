*** s101a03 ***;

  /**************************************************
    EASY way
    DICTIONARY tables are discussed in a later Chapter
  ***************************************************/
proc sql;
title "Tables containing the Employee_ID column";
   select distinct MEMNAME 
      from Dictionary.Columns
      where libname="ORION" 
            and UPCASE(NAME)="EMPLOYEE_ID"
;
proc sql;
title "Tables containing the Order_Date column";
   select distinct MEMNAME 
      from Dictionary.Columns
      where libname="ORION" 
            and UPCASE(NAME)="ORDER_DATE"
;
quit;

  /**************************************************
	Hard Way
  ***************************************************/
proc sql;
title 'orion.Customer_dim';
   select *
      from orion.Customer
;
title 'orion.Employee_Addresses';
   select *
      from orion.Employee_Addresses
;
title 'orion.Employee_donations';
   select *
      from orion.Employee_donations
;
title 'orion.Employee_Organization';
   select *
      from orion.Employee_Organization
;
title 'orion.Employee_Payroll';
   select *
      from orion.Employee_Payroll
;
title 'orion.Employee_Payroll';
   select *
      from orion.Employee_phones
;
title 'orion.Order_fact';
   select *
      from orion.Order_fact
;
title 'orion.Product_dim';
   select *
      from orion.Product_dim
;
title 'orion.Price_list';
   select *
      from orion.Price_list
;
title 'orion.QTR1_2007 ';
   select *
      from orion.QTR1_2007
;
title 'orion.QTR2_2007 ';
   select *
      from orion.QTR1_2007
;
title 'orion.Sales';
    select *
       from orion.Sales
;
title 'orion.Salesstaff';
   select *
      from orion.Salesstaff
;
title 'orion.Staff';
   select *
      from orion.Staff
;
quit;
title;

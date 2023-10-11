***   s103s03 ***;  

proc sql; 
title "US Customers >50 Years Old as of 31DEC2007";
   select Customer_ID format=z7. 'Customer ID',
          catx(', ',Customer_LastName,Customer_FirstName)
               format=$20. 'Last Name, First Name' as Name, 
          Gender 'Gender',
          int(('31dec2007'd-Birth_Date)/365.25) as Age
      from orion.Customer
      where Country="US"
        and calculated Age > 50
     order by Age desc, Name
;
quit;
title;

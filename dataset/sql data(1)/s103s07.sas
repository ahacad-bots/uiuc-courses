*** s103s07 ***;

proc sql;
title "Countries with more Female than Male Customers";
   select Country, 
          sum(Gender="M") as M "Male Customers", 
          sum(Gender="F") as F "Female Customers" 
      from orion.Customer
      group by Country
      having F > M
      order by F desc
;
quit;
title;

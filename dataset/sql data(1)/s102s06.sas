*** s102s06 ***;

proc sql;
title 'Employees Who Contributed 90% ';
title2 'To Charitable Companies That Are ';
title3 'Also Incorporated (Inc.)';
   select Employee_ID, Recipients
      from orion.Employee_Donations
      where Recipients like "% Inc. 90~%%" ESCAPE "~";
quit;
title;

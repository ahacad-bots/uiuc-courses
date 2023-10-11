*** s103d03 ***;

proc sql;
   select Employee_ID 
          label='Employee Identifier',
          sum(Qtr1,Qtr2,Qtr3,Qtr4) 
          'Annual Donation' /*ANSI Label*/
	      format=dollar7.2, 
          Recipients
      from orion.Employee_donations
      where Paid_By ="Cash or Check"
      order by 2 desc
;
quit;


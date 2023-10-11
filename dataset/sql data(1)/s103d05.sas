*** s103d05 ***;

proc sql;
   select Employee_ID 
          label='Employee Identifier',
          Qtr1,Qtr2,Qtr3,Qtr4,
          sum(Qtr1,Qtr2,Qtr3,Qtr4) 
          label='Annual Donation' 
          format=comma9.2
      from orion.Employee_donations
      where Paid_By="Cash or Check"
      order by Employee_ID
;
quit;

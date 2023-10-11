*** s102d10a ***;

proc sql;
   select Employee_ID,  Birth_Date, 
          month(Birth_Date) as Birth_Month, 
          Employee_gender
      from orion.Employee_Payroll;
quit;

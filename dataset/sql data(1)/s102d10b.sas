*** s102d10b ***;

proc sql;
   create table work.birth_months as
      select Employee_ID,  Birth_Date, 
             month(Birth_Date) as Birth_Month, 
             Employee_gender
         from orion.Employee_Payroll;
   describe table work.birth_months;
   select * from work.birth_months;
quit;

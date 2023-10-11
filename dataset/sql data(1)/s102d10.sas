*** s102d10 ****;

proc sql;
   select Employee_ID, Employee_Gender,
          int((today()-Birth_Date)/365.25)
          as Age
      from orion.Employee_Payroll;
quit;

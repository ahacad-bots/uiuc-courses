*** s102s01 ***;
 /*a*/

proc sql;
   select *
      from orion.Employee_Payroll;
quit;

  /*b*/ 
proc sql; 
   select Employee_ID, Employee_Gender, Marital_Status,
          Salary
      from orion.Employee_Payroll;
quit;

*** s108s04 ***;

  /* a. */
proc sql;
title "Highest Salary in Employee_Payroll";
   select max(Salary)
      from orion.Employee_Payroll
;
quit;
title;

  /* b. */
%let DataSet=Employee_Payroll;
%let VariableName=Salary;
%put NOTE:  DataSet=&DataSet, VariableName=&VariableName;


  /* c. */
proc sql;
title "Highest &VariableName in &DataSet";
   select max(&VariableName)
      from orion.&DataSet
;
quit;
title;

  /* d. */
%let DataSet=Price_List;
%let VariableName=Unit_Sales_Price;
proc sql;
title "Highest &VariableName in &DataSet";
   select max(&VariableName)
      from orion.&DataSet
;
quit;
title;

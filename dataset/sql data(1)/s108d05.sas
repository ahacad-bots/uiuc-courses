*** s108d05 ***;

%let datasetname=Employee_Payroll;
%let bigsalary=100000;
options symbolgen;
proc sql;
title "Salaries > &bigsalary";
   select  Employee_ID, Salary
      from orion.&datasetname
      where Salary > &bigsalary
;
quit;
title;

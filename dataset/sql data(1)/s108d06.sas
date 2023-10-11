*** s108d06 ***;

%let datasetname=Employee_Payroll;
%let bigsalary=100000;
options symbolgen;
proc sql noprint;
   select avg(Salary)
      into :MeanSalary
      from orion.Employee_Payroll;
%put The average salary is &MeanSalary;
   select avg(Salary),min(Salary),max(Salary)
      into :MeanSalary, :MinSalary, :MaxSalary
      from orion.Employee_Payroll;
%put Mean: &meansalary Min: &minsalary 
     Max: &maxsalary;
quit;

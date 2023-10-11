*** s103d10 ***;

proc sql;
title "Male Employee Salaries";
   select Employee_ID, Salary	format=comma12.,
          Salary / sum(Salary) format=percent6.2
      from orion.Employee_Payroll
      where Employee_Gender="M"
            and Employee_Term_Date is missing
      order by 3 desc
;
quit;
title;


  /* Alternative Solution with procedures and  */
  /* the DATA step                             */
  
proc means data=orion.Employee_Payroll 
            (where=(Employee_Gender="M" and Employee_Term_Date  
                    is missing)) sum noprint;
   output out=summary sum=TotalSalary;
   var salary;
run;
data report;
   merge orion.Employee_Payroll (where=(Employee_Gender="M" 
                                 and Employee_Term_Date is 
                                 missing)) summary  
                                 (keep=TotalSalary);
   retain Total 0;
   if _n_=1 then Total=TotalSalary;
   Percent=Salary / Total ;
   keep Employee_ID Salary Percent;
   format salary comma12.2 Percent percent6.2;
run;
proc sort data=report;
   by descending Percent;
run;
title "Male Employee Salaries - Traditional SAS Programming";
proc print data=report noobs split='*';
   label Percent='*';
run;
title;
 

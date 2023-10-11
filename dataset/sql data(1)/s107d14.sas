*** s107d14 ***;  
proc sql;
create view orion.Tom_Zhou as
   select Employee_Name as Name format=$25.0,
          Job_Title as Title format=$15.0,
          Salary "Annual Salary" format=comma10.2, 
          int((today()-Employee_Hire_Date)/365.25) 
             as YOS 'Years of Service'
      from orion.Employee_Addresses as a,
           orion.Employee_Payroll as p,
           orion.Employee_Organization as o
      where a.Employee_ID=p.Employee_ID and
            o.Employee_ID=p.Employee_ID and
            Manager_ID=120102
      using libname orion '.' 
  /*  using libname orion '.WORKSHOP.SASDATA' */
;
quit;
libname tom "./test";
*libname tom '.WORKSHOP.TEST'; /* z/OS mainframe */
proc copy in=orion out=tom memtype=view;
   select Tom_Zhou;
run;
options ls=80;
title "Tom Zhou's Group - Salary Statistics";
proc means data=tom.Tom_Zhou min mean max;
   var salary;
   class Title;
run;
title;

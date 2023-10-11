 *** s105s04 ***;

proc sql;
title "Employees With More Than 30 Years of Service";
title2 "As of December 31, 2007";
   select emp.Employee_Name 'Employee Name' format=$35., 
          int(('31DEC2007'd-Employee_Hire_Date)/365.25)
             as YOS 'Years of Service',
          mgr.Employee_Name 'Manager Name' as Manager_Name
      /* Employee_Addresses: 
         First copy is required to
         look up Employee information Employee's
         Employee_ID */
      /* Employee_Organization: 
         Links Employee_ID to Manager_ID */
      /* Employee_Addresses: 
         Second copy is required to
         look up Manager information using Manager's
         Employee_ID */
      from orion.Employee_Addresses as emp,
         orion.Employee_Organization as org,
           orion.Employee_Payroll as pay,
         orion.Employee_Addresses as mgr
     where emp.Employee_ID=pay.Employee_ID
           and emp.Employee_ID=org.Employee_ID
           and org.Manager_ID=mgr.Employee_ID
           and calculated YOS gt 30
     order by Manager_Name, YOS desc, Employee_Name
;
quit;
title;

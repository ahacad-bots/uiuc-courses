*** s106a02 ***;

proc sql;
   select Employee_ID, Job_Title
      from orion.Employee_organization
    except all  
    select Employee_ID, Job_Title
        from orion.Sales;
quit;

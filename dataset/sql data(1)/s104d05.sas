*** s104d05 ***;
  /* Create temporary table work.SUPERVISORS */
proc sql;  
   create table work.Supervisors as 
      select distinct Manager_Id as Employee_Id, 
             upcase(Country) as Country
         from orion.Employee_Addresses as e, 
              orion.Staff as s
         where e.Employee_Id=s.Manager_Id
           and e.employee_id in 
              (120103,120104,120260,120262,120668,120672,120679,120735,
               120736,120780,120782,120798,120800,121141,121143)
;
quit;

proc sql;
   select Employee_ID, 
          catx(' ',scan(Employee_Name,2),
          scan(Employee_Name,1))as Manager_Name 
          length=25
      from orion.Employee_Addresses
      where 'AU' = 
         (select Country
	    from work.Supervisors
	    where Employee_Addresses.Employee_ID=
                  Supervisors.Employee_ID);
quit;


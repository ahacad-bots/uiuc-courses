*** s109d08 ***;

proc sql;
   create table Address as
      select * 
         from orion.Employee_Addresses
   ;
   create table Org as
      select * 
         from orion.Employee_Organization
   ;
   create table Pay as
      select * 
         from orion.Employee_Payroll
   ;
quit;
proc sql;
   create view Mailing as
      select Employee_ID, Employee_Name as Name, 
             catx(' ',put(Street_Number,12.), Street_Name) 
             as Address, City, State, Country
          from work.Address
   ;
quit;
proc sql;
   update Mailing
      set Name="Jones, Gabriele"
      where Employee_ID=120109
   ;
   select Employee_Name 
      from Address
      where Employee_ID=120109
   ;
quit;
proc sql;
   update Mailing
      set Address="123 Bland Street"
      where Employee_ID=120109
   ;
quit;

proc sql;
   create view Mailing as
      select Employee_ID, Employee_Name as Name, 
             catx(' ',put(Street_Number,12.), Street_Name) 
             as Address, City, State, Country
          from work.Address
          order by Country, State, City, Name
   ;
   update Mailing
      set Name="Janes, Selina"
      where Employee_ID=120168
  ;
quit;
proc sql;
   create view Gender_Pay as
      select Employee_Gender as Gender,
             sum(Salary) as Total_Pay
          from work.Pay
	      group by gender
   ;
quit;
proc sql;
   update Gender_pay
      set Total_Pay=Total_pay*1.10
	   where Gender="F"
   ;
quit;
proc sql;
   create view Skill_level as
      select p.*, 
             case (scan(Job_Title,-1))
                when 'I'   then 'Apprentice'
                when 'II'  then 'Journeyman'
                when 'III' then 'Master'
                when 'IV'  then 'Mentor'
                else ''
             end as Level
         from work.Pay as p,
              work.Org as o
         where p.Employee_ID=o.Employee_ID
   ;
quit;
proc sql;
   update Skill_level
      set Salary=Salary*1.05
      where Level="Apprentice"
   ;
quit;

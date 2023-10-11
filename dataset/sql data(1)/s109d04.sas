***  s109d04 ***;

proc sql;
   create table Staff as
      select *, "" as Level length=10 
         from orion.staff
;
quit;
proc sql;
   update work.Staff
      set Level=
	      case (scan(Job_Title,-1))
             when 'I'   then 'Apprentice'
             when 'II'  then 'Journeyman'
             when 'III' then 'Master'
            when 'IV'  then 'Mentor'
            else ''
          end;
   select Employee_ID, Job_Title, Level
      from work.Staff;
quit;

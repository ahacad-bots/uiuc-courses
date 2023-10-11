*** s102d13b ***;

  /* Run first to create work.Employee_Organization2 */
proc sql;
   create table work.Employee_Organization2(drop=code1-code3) as
	  select *, scan(Job_Title,1,' ') as code1 length=1,
	            scan(Job_Title,2,' ') as code2 length=1,
	     		scan(Job_title,3,' ') as code3 length=3,
				case 
                   when calculated code3='II' 
                        then calculated code1||
                             calculated code2||
                             '_'||calculated code3 
                   else calculated code1||
                        calculated code2||
                         calculated code3 
				 end as Job_code 
	     from orion.Employee_Organization
         where Job_Title contains 'I';
quit;

  /* ESCAPE Clause */
proc sql;
   select Employee_ID, Job_Code
      from work.Employee_Organization2
      where Job_Code like 'SA/_%' ESCAPE '/';
quit;

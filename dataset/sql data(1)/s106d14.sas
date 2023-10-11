*** s106d14 ***;

data work.Admin_I work.Admin_II work.Admin_III work.Admin_IV;
     set orion.staff(keep=Employee_ID Job_Title Salary 
                     where=(Job_Title contains 'Secretary' or 
                            Job_Title contains 'Office A'));
	 level=scan(Job_Title,-1,' ');
	 if level = 'I' then output work.Admin_I;
	 else if level='II' then output work.Admin_II;
	 else if level='III' then output work.Admin_III;
	 else output Admin_IV;
	 drop level;
run;

proc sql;
   select *
      from work.Admin_I
   outer union corr
   select *
      from work.Admin_II
   outer union corr
   select *
      from work.Admin_III
   outer union corr
   select * 
	  from work.Admin_IV;
quit;


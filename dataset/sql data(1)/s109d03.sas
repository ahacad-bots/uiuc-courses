***  s109d03 ***;

proc sql; 
   create table work.sales as
      select *
         from orion.Sales;
quit;

proc sql;
   update work.Sales
      set Salary=Salary * 1.05
	  where Job_Title='Sales Rep. I';
quit;


  /* Equivalent Data Step Code */
data work.Sales;
   modify work.Sales;
   if Job_Title='Sales Rep. I' then
      Salary=Salary * 1.05;
run;

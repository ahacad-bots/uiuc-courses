*** s103d06 ***;

proc sql;
   select sum(Qtr1) 
          'Total Quarter 1 Donations'
      from orion.Employee_Donations
;
quit;

proc means data=orion.Employee_donations 
            sum maxdec=0;
   var Qtr1;
run;

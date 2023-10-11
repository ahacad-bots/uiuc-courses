*** s105d12 ***;

%include "s105d00a.sas"; /* Windows and Unix */
*%include ".WORKSHOP.SASCODE(S105D00A)"; /* z/OS mainframe */
proc sort data=one; by x; run;
proc sort data=two; by x; run;
data merged; 
   merge one two;
   by x;
run;
proc print data=merged noobs;
run;

%include "s105d00a.sas"; /* Windows and Unix */
*%include ".WORKSHOP.SASCODE(S105D00A)"; /* z/OS mainframe */

proc sql;
   select one.x, a, b
      from one full join two
      on one.x=two.x
;
quit;
proc sql;
   select coalesce(one.x,two.x) as X,
          a,b
      from one full join two
      on one.x=two.x
;
quit;

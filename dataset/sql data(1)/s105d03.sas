*** s105d03 ***;  

%include "s105d00a.sas" /source2;/* Windows and Unix */
*%include ".WORKSHOP.SASCODE(S105D00A)" /source2; /* z/OS mainframe */
proc sql;
   select one.x,a,b
      from one, two
      where one.x=two.x
;
quit;

proc sql;
   select * 
      from one natural join two
;
quit;

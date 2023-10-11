*** s105d01 ***;  

%include "s105d00a.sas" /source2; /* Windows and Unix */
*%include ".WORKSHOP.SASCODE(S105D00A)" /source2; /* z/OS mainframe */
proc sql;
   select *
      from one, two
;
quit;

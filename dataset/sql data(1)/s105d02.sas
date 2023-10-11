*** s105d02 ***;

%include "s105d00a.sas" /source2;/* Windows and Unix */
*%include ".WORKSHOP.SASCODE(S105D00A)" /source2; /* z/OS mainframe */
proc sql;
   create table test as
   select *
      from one, two;
      *where one.x=two.x
;
quit;

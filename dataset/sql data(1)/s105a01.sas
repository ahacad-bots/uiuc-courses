  *** s105a01 ***;

%include "s105d00b.sas" /source2;/* Windows and Unix */
*%include ".WORKSHOP.SASCODE(S105D00B)" /source2; /* z/OS mainframe */
proc sql;
select * 
	from three, four
;
quit;

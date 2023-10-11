*** s109d05 ***;
%include 's109d00a.sas' /source2; /* Windows and Unix */
*%include '.WORKSHOP.SASCODE(s109D00A)' /source2; /* z/OS mainframe */

proc sql;
   delete from three
      where b contains '1';
quit;

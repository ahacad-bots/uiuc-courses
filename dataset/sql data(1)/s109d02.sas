*** s109d02 ***;
%include 's109d00a.sas' /source2; /* Windows and Unix */
*%include '.WORKSHOP.SASCODE(s109D00A)' /source2; /* z/OS mainframe */


proc sql;
   update three
      set x=x*2
	  where b contains 'a';
quit;

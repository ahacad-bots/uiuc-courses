*** s105a02 ***;
 /* NOTE:  CHANGE S105d00b.sas so Table Three has col X and A */
%include "s105d00b.sas" /source2;/* Windows and Unix */
data new;
   merge three (in=InThree)
         four (in=InFour);
   by x;
   if InThree and InFour;
run;
proc print data=new;
run;

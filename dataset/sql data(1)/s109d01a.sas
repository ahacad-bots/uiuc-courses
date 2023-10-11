*** s109d01a ***;
%include 's109d01.sas'; /* Windows and Unix */
*%include '.WORKSHOP.SASCODE(s109D01)'; /* z/OS mainframe */

options msglevel = i;
proc sql;
   select *
      from work.Employee_addresses
      where City in ('Philadelphia','San Diego');

   select *
      from work.Employee_addresses
      where Postal_Code ='33135';
quit;

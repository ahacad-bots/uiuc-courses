*** s108s01 ***;  

  /* a. */
proc sql flow=6 35;
title "Dictionary Tables";
   select distinct memname,memlabel
      from dictionary.Dictionaries
;
quit;
title;

  /* b. */
proc sql;
   select Memname, type, length
      from dictionary.Columns
      where libname="ORION"
            and upcase(Name)="CUSTOMER_ID"
;
quit;

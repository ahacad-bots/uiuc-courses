*** s108s02 ***;

  /* a. */
proc sql flow=6 35;
title "Dictionary Tables";
   select memname as Table, memlabel as Contents,
          count(*) as Columns
      from dictionary.Dictionaries
      group by Table, Contents
;
quit;
title;

  /* b. */
proc  sql flow=6 35;
   select memname "Table",
          nobs "Rows",
          nvar "Columns", 
          filesize "File Size", 
          maxvar 'Widest Column',
          maxlabel 'Widest Label'
      from dictionary.tables
      where libname='ORION'
            and memtype ne 'VIEW' 
;
quit;

*** s108s03 ***;

  /*****************************************************
   This query remerges summary data and will not work
   if OPTIONS SQLREMERGE=NO is in effect.
  *****************************************************/

options ls=85 ps=20;
ods listing close;
ods pdf file="ORION Library Table Documentation.PDF" style=journal;
ods proclabel "ORION Library Tables";

proc  sql flow=2 25;
title "ORION Library Table Information";
footnote "* Largest in the Library";
   select memname "Table",
          cats(nobs,
      	       case 
	              when nobs=max(nobs) then "*"
                  else "" 
                end) "Rows",
          cats(nvar, 
	           case 
	              when nvar=max(nvar) then "*" 
                  else "" 
                end) "Columns", 
          cats(put(filesize,comma12.), 
	           case 
	              when filesize=max(filesize) then "*" 
                  else "" 
               end) "File Size (Bytes)", 
          cats(maxvar, 
	           case 
	              when maxvar=max(maxvar) then "*" 
                  else "" 
                end) 'Widest Column'
      from dictionary.tables
      where libname='ORION'
            and memtype ne 'VIEW' 
;
quit;
title;
ods pdf close;
ods listing;
footnote;

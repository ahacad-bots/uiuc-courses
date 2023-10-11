*** s108d04 ***;
proc tabulate data=sashelp.vmember 
              format=8.;
   class libname memtype;
   keylabel N=' ';
   table libname, memtype/rts=10 
         misstext='None';
   where libname in ('ORION','SASUSER','WORK', 'SASHELP');
run;

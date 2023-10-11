*** s108d03 ***; 

options nolabel nocenter;

proc sql flow=6 25;
   describe table dictionary.dictionaries
;
   select memname as Table, 
          name as Column, Type
      from Dictionary.Dictionaries
;
   describe table dictionary.tables
;

   select memname,nobs,nvar,crdate
      from dictionary.tables
      where libname='ORION'
;
   select Name,Type,Length
      from dictionary.columns
      where libname='ORION'
            and memname='EMPLOYEE_ADDRESSES'
;
   select memname, name
      from dictionary.columns
         where libname='ORION' and 
	           upcase(name)='EMPLOYEE_ID';
quit;


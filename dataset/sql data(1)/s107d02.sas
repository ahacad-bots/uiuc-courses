** s107d02 ***;

proc sql;
   create table Testing_Types
      (Char_Column char(4),
       Varchar_Column varchar,
       Int_Column int, 
       SmallInt_Column smallint, 
       Dec_Column dec, 
       Num_Column num, 
       Float_Column float, 
       Real_Column real,
       Date_Column date,
       Double_Column Double Precision
       )
;
quit;
proc contents data=Testing_Types varnum;
run;

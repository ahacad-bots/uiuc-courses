/*******************************
***    Unit 1-6 Exercises    ***
*******************************/

libname orion 'D:\440\Unit1';


/* Exercise 1 */
libname custfm 'custfm.xls';

proc contents data=custfm._all_;
run;

data work.males;
   set custfm.'Males$'n;
   keep First_Name Last_Name Birth_Date;
   format Birth_Date year4.;
   label Birth_Date='Birth Year';
run;

proc print data=work.males label;
run;

libname custfm clear;


/* Exercise 2 */
libname prod 'products.xls';

proc contents data=prod._all_;
run;

data work.golf;
   set prod.'Sports$'n;
   where Category='Golf';
   drop Category;
   label Name='Golf Products';
run;

libname prod clear;

proc print data=work.golf label;
run;


/* Exercise 3 */
libname mnth 'mnth2007.xls';

proc copy  in=orion out=mnth;
   select mnth7_2007 mnth8_2007 mnth9_2007;
run;

proc contents data=mnth._all_;
run;

libname mnth clear;


/* Exercise 4 */
proc print data=work.children;
run;

/* If you ran the Import Wizard correctly, this is what children.sas will look like. */
PROC IMPORT OUT= WORK.children 
            DATAFILE= "D:\440\Unit1\products.xls" 
            DBMS=EXCEL REPLACE;
     RANGE="Children$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;



/* Exercise 5 */

/* If you ran the Export Wizard instead, it should still look something like this. */
proc export data=orion.mnth7_2007 
            outfile='mnth7.xls' 
            dbms=excel replace;
run;

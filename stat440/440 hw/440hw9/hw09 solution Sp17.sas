/*******************************
***   Homework 9 Solutions   ***
*******************************/

option nodate pageno=1 center ls=96 ;
ods pdf file='C:\440\hw09\hw09 solution Sp17.pdf';
libname hw09 'C:\440\hw09';

title 'Homework 9 Report';


/* Exercise 1 */
/*a*/
proc sort data=hw09.demographic out=demographic;
   by ID;
run;
proc sort data=hw09.survey1 out=survey1;
   by Subj;
run;
data work.demo1;
   merge demographic survey1(rename=(Subj=ID));
   by ID;
run;


/*b*/
title2 'Part 1b';
proc print data=work.demo1;
run;


/*c*/
/* Solution where the numeric identifier is converted
   to a character value. */
proc sort data=hw09.demographic out=demographic;
   by ID;
run;
data survey2;
   set hw09.survey2(rename=(ID=NumID));
   ID = put(NumID,z3.);
   drop NumID;
run;
proc sort data=survey2;
   by ID;
run;
data work.demo2;
   merge demographic survey2;
   by ID;
run;

/* Solution where the character identifier is converted
   to a numeric value. */
data demographic;
   set hw09.demographic(rename=(ID=CharID));
   ID = input(CharID,3.);
   drop CharID;
   format ID z3.;
run;
proc sort data=demographic;
   by ID;
run;
proc sort data=hw09.survey2 out=survey2;
   by ID;
run;
data work.demo2;
   merge demographic survey2;
   by ID;
run;


/*d*/
title2 'Part 1d';
proc print data=work.demo2;
run;



/* Exercise 2 */
/*a*/
data updated;
   set hw09.fivepeople (rename=(ID=IDchar Phone=Phonechar));
   ID = input(IDchar,4.);
   Name = scan(Name,2,' ') !! ', ' !! scan(Name,1,' ');
   Phone = input(compress(Phonechar,'() -'),10.);
   /* Alternative using modifiers: K=keep D=digits
   Phonechar = compress(Phonechar, , 'KD');
   Phone = input(Phonechar, 10.);
   */

   HtSymbol = compbl(compress(translate(lowcase(Height), "'",'ft', '"','in'),'.'));
   /* Alternative: TRANWRD but it takes more than one statement.
   HtSymbol = tranwrd(lowcase(Height),'ft',"'");
   HtSymbol = tranwrd(lowcase(HtSymbol),'in','"');
   HtSymbol = compress(HtSymbol,'.');
   */

   Height = compress(Height,'INFT.','I');
   /* Alternative: keep digits and blanks
   Height = compress(Height,' ','KD');
   */
   Feet = input(scan(Height,1,' '), 8.);
   Inches = input(scan(Height,2,' '), 8.);
   HtInches = sum(12*Feet, Inches);

   Integer = input(scan(Weight,1,' /'), 8.);
   Numerator = input(scan(Weight,2,' /'), 8.);
   Denominator = input(scan(Weight,3,' /'), 8.);
   WtPounds = sum(Integer, Numerator/Denominator);
   /* Alternative: Better to calculate HtInches and WtPounds each
      with just one statement without creating the temporary variables,
      but I split it up so you could see the steps easier.
      This method also uses automatic conversion instead of explicit
      conversion with an INPUT function.
   HtInches = sum(12*scan(compress(Height,'INFT.','I'),1,' '), 
                  scan(compress(Height,'INFT.','I'),2,' ') );
   WtPounds = sum(scan(Weight,1,' /'), 
                  scan(Weight,2,' /') / scan(Weight,3,' /') );
   */

   format WtPounds 8.3;
   drop IDchar Phonechar Height Feet Inches Numerator Denominator Integer;
run;

/*b*/
title2 'Part 2b';
proc print data=updated noobs;
   var ID Name Phone HtSymbol HtInches Weight WtPounds;
run;

/*c*/
title2 'Part 2c';
proc contents data=updated;
run;

ods pdf close;
title;

/*******************************
***   Homework 6 Solutions   ***
*******************************/

option nodate pageno=1 center ls=96 ;
ods rtf file='C:\440\hw06\hw06 solution Sp17.rtf';
libname hw06 'C:\440\hw06';

title 'Homework 6 Report';


/* Exercise 1 */
/*a*/
proc sort data=hw06.purchase out=purchase;
   by Model;
run;
proc sort data=hw06.inventory out=inventory;
   by Model;
run;

data purchase_price;
   merge inventory purchase(in=inP);
   by Model;
   if inP;   * OR... if inP=1;
   TotalCost = Quantity*Price;
   format TotalCost dollar8.2;
run;

/*b*/
title2 'Part 1b';
proc print data=purchase_price noobs;
run;

/*c*/
data hw06.not_purchased;
   merge inventory(in=inI) purchase(in=inP);
   by Model;
   if not inP;   * OR... if inI and not inP;
   keep Model Price;
run;

/*d*/
title2 'Part 1d';
proc print data=hw06.not_purchased noobs;
run;

/*e*/
data purchase_price hw06.not_purchased(keep=Model Price);
   merge inventory(in=inI) purchase(in=inP);
   by Model;
   if inP then do;
         TotalCost = Quantity*Price;
         format TotalCost dollar8.2;
         output purchase_price;
	  end;
   else if not inP then output hw06.not_purchased;
   /* OR (for this set of datasets) you could use either of the following... */
   * else if inI and not inP then output hw06.not_purchased;
   * else output hw06.not_purchased;
run;



/* Exercise 2 */
/*a*/
/* Using _all_ will produce output for every dataset in the hw06
   library, even those from Exercise 1. */
title2 'Part 2a';
proc contents data=hw06._all_ ;
run;

/*b*/
data work.fmli2007;
   set hw06.fmli071(in=InQ1) hw06.fmli072(in=InQ2) 
       hw06.fmli073(in=InQ3) hw06.fmli074(in=InQ4);
   QTR = InQ1 + 2*InQ2 + 3*InQ3 + 4*InQ4;
   /* or...
   if InQ1 then QTR=1;
   else if InQ2 then QTR=2;
   else if InQ3 then QTR=3;
   else if InQ4 then QTR=4;
   */
run;

/*c*/
title2 'Part 2c';
proc contents data=work.fmli2007;
run;

/*d*/
/* Concatenate member data from 4 quarters */
data memi2007;
   set hw06.memi071(in=InQ1) hw06.memi072(in=InQ2)
       hw06.memi073(in=InQ3) hw06.memi074(in=InQ4);
   QTR = InQ1 + 2*InQ2 + 3*InQ3 + 4*InQ4;
   /* or...
   if InQ1 then QTR=1;
   else if InQ2 then QTR=2;
   else if InQ3 then QTR=3;
   else if InQ4 then QTR=4;
   */
run;

/*e*/
title2 'Part 2e';
proc contents data=work.memi2007;
run;

/*f*/
/* If you trust the INT_NUM variable, you could use it in place
   of QTR in the following steps. */
proc sort data=work.fmli2007;
   by CU_ID QTR;
run;
proc sort data=work.memi2007;
   by CU_ID QTR;
run;
data hw06.ce2007;
   merge work.fmli2007 work.memi2007;
   by CU_ID QTR;
run;

/*g*/
title2 'Part 2g';
proc contents data=hw06.ce2007;
run;

/*h*/
data atleast_three all_four;
   merge hw06.fmli071(in=InQ1) hw06.fmli072(in=InQ2) hw06.fmli073(in=InQ3) hw06.fmli074(in=InQ4);
   by CU_ID;
   if InQ1 + InQ2 + InQ3 + InQ4 >= 3 then do;  
      output atleast_three;
	  if InQ1 & InQ2 & InQ3 & InQ4 then   /* OR...  if InQ1 * InQ2 * InQ3 * InQ4; */
         output all_four;
   end;
   keep CU_ID;
run;

/* Alternate solution */
proc freq data=fmli2007 noprint;
   table CU_ID / out=atleast_three (where=(count >= 3));
   table CU_ID / out=all_four(where=(count=4));
run;

/*i*/
title2 'Part 2i';
ods select Attributes;
proc contents data=atleast_three;
run;
ods select Attributes;
proc contents data=all_four;
run;


title;
ods rtf close;

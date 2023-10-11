*** s106d15 ***;

  /* Step 1 */
proc sql;
   create table One
      (X num, A char(1));
   insert into One
      values (1,'a')
      values (1,'a')
      values (1,'b')
      values (2,'c')
      values (3,'v')
      values (4,'e')
      values (6,'g') ;
   select * from One;
      create table Two
         (X num,A char(1));
   insert into Two
      values (1,'x')
      values (2,'y')
      values (3,'z')
      values (3,'v')
      values (5,'w');
   select * from Two;
quit;

  /* Step 2: DATA STEP */
data three;
   set one two;
run;
proc print data=three;
run;

  /* Step 3: PROC SQL STEP */
proc sql;
   select * from one
   outer union corr
   select * from two;
quit;

  /* Step 4: PROC APPEND STEP */
  /* Submit Step 1 again */
  /* Now submit Step 4 */

proc append base=one data=two;
run;
proc print data=one noobs;
run;

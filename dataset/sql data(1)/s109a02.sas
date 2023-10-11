*** s109a02 ***;

proc freq data=orion.Order_fact ;
   tables Order_Type/nocum;
run;

data work.price_increase;
   set orion.prices;
run;
proc print data=work.price_increase;
run;

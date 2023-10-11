*** s107s05 ***;  
proc sql;
   create table orion.Rewards
      (Purchased num format=comma9.2,
       Year num format=4., Level char(9), 
       Award char(50))
;
quit;
proc sql;
   insert into orion.Rewards (Year,Level,Purchased,Award)
      values (2006,'Silver',200,'25% Discount on one item over $25')
      values (2006,'Gold',300,'15% Discount on one order over $50')
      values (2006,'Platinum',500,'10% Discount on all 2007 purchases')
      values (2007,'Silver',225,'25% Discount on one item over $50')
      values (2007,'Gold',350,'15% Discount on one order over $100')
      values (2007,'Platinum',600,'10% Discount on all 2008 purchases')
;
quit;
proc sql;
  select * 
     from orion.Rewards;
quit;

  /*****************************************************
   Alternate method - add the data using set clauses
proc sql;
   insert into orion.Rewards
      set year=2006,Level='Silver',Purchased=200,
          Award='25% Discount on one item over $25'
      set year=2006,Level='Gold',Purchased=300,
          Award='15% Discount on one order over $50'
      set year=2006,Level='Platinum',Purchased=500,
          Award='10% Discount on all 2007 purchases'
      set year=2007,Level='Silver',Purchased=225,
          Award='25% Discount on one item over $50'
      set year=2007,Level='Gold',Purchased=350,
          Award='15% Discount on one order over $100'
      set year=2007,Level='Platinum',Purchased=600,
          Award='10% Discount on all 2008 purchases'
;
quit;
   *****************************************************/

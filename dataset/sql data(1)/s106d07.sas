*** s106d07 ***;
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
         (X num,B char(1));
   insert into Two
      values (1,'x')
      values (2,'y')
      values (3,'z')
      values (3,'v')
      values (5,'w');
   select * from Two;

   select *
      from one
   intersect corr
   select *
      from two;
quit;

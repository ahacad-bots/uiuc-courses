*** s106a03 ***;

proc sql;
   create table AAA
      (X num, A char(1));
   insert into AAA
      values (1,'a')
      values (1,'a')
      values (1,'b')
      values (2,'c')
      values (3,'v')
      values (4,'e')
      values (6,'g') ;
      create table BBB
         (X num,B char(1));
   insert into BBB
      values (1,'a')
      values (1,'a')
      values (2,'z')
      values (3,'z')
      values (3,'v')
      values (5,'w');
quit;

proc sql; 
   select *
      from aaa
   intersect 
      select *
         from bbb;
quit;

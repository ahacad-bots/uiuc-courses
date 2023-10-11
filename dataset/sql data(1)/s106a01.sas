 *** s106a01 ***;

proc sql;
  create table Alpha
   (X num,A char(1));
  insert into Alpha
     values (1,'x')
     values (1,'y')
     values (3,'z')
     values (4,'v')
     values (5,'w');
   create table Beta
      (X num, B char(1));
   insert into Beta
      values (1,'x')
      values (2,'y')
      values (3,'z')
      values (3,'v')
      values (5,'v');
quit;

proc sql;
   select *
      from Alpha 
   except corr all
   select *
      from Beta;
quit;

*** s105d00b ***;

proc sql;
   create table work.Three
      (X num format=1.,A CHAR(2));
   insert into work.Three
      values(1,'a1')
      values(1,'a2')
      values(2,'b1')
      values(2,'b2')
      values(4,'d')
;
   create table work.Four
      (X num format=1.,B CHAR(2));
   insert into work.Four
     values(2,'x1')
     values(2,'x2')
     values(3,'y')
     values(5,'v')
;
quit;

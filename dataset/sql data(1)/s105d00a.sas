*** s105d00a ***;

proc sql;
   create table work.One
      (X num format=1.,A CHAR(1));
   insert into work.One
	  values(1,'a')
	  values(4,'d')
	  values(2,'b')
;
   create table work.Two
      (X num format=1.,B CHAR(1));
   insert into work.Two
	  values(2,'x')
	  values(3,'y')
	  values(5,'v')
;
quit;

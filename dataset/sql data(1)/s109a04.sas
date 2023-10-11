*** s109a04 ***;

proc sql;
   update Mailing
      set Name="Jones, Gabriele"
      where Employee_ID=120109
   ;
   select Employee_Name 
      from Address
      where Employee_ID=120109
   ;
quit;

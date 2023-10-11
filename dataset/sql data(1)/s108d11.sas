*** s108d11 ***;

options fullstimer;
proc sql stimer flow=15 25;
   select distinct Order_ID, Order_Date, Employee_Name, Phone_Number
      from orion.Order_Fact as or,
	       orion.Employee_Addresses as adr,
           orion.Employee_Phones as ph
      where or.Employee_ID=adr.Employee_ID
            and ph.Employee_ID=adr.Employee_ID
            and Phone_Type="Home"
      order by Employee_name, Order_date
;
quit;

  /* PROC AND DATA STEP EQUIVALENT */
proc sort data=orion.Order_Fact
          (keep=Employee_ID Order_ID Order_Date 
           where=(Employee_ID ne 99999999)) 
          out=or nodupkey;
   by Employee_ID Order_ID;
run;
proc sort data=orion.Employee_Addresses 
          (keep=Employee_ID Employee_Name)
          out=adr;
   by Employee_ID;
run;
proc sort data=orion.Employee_Phones 
          (where=(Phone_Type="Home")) out=ph;
   by Employee_ID;
run;
data report;
   length Order_ID Order_Date Employee_ID 8;
   merge or (in=ordered)
         adr ph;
	by Employee_ID;
	if ordered;	
	drop Phone_Type Employee_ID;
run;
proc sort data=report;
   by Employee_name Order_date;
run;
proc print data=report label noobs;
run;

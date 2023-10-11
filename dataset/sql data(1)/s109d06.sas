*** s109d06 ***;

proc sql flow=10 20;
   create table work.Sales_staff as
      select Employee_ID, catx(', ',Last_Name, First_Name) 
             as Name,
             Job_Title, Salary, Gender,
	         Birth_Date, Hire_Date,Country
	     from orion.Sales
		 order by Last_Name, First_Name
   ;

   alter table work.Sales_staff
      add First char(10), Last Char(20)
      modify Birth_Date date format=mmddyy10.
   ;

   update work.Sales_staff
      set First=strip(scan(Name,2,',')),
          Last=strip(scan(Name,1,','))
   ;
   select Name, First, Last
      from work.Sales_staff
      where First ne strip(scan(Name,2,','))
	        or Last ne strip(scan(Name,1,','))
   ;
   alter table work.Sales_staff
      modify First char(20)
   ;
   update work.Sales_staff
      set First=strip(scan(Name,2,','))
   ;
   select Name, First, Last
      from work.Sales_staff
      where First ne strip(scan(Name,2,','))
        	or Last ne strip(scan(Name,1,','))
   ;
quit;

/*******************************
***    Unit 1-9 Exercises    ***
*******************************/

libname orion 'D:\440\Unit1';


/* Exercise 1 */
data work.increase;
   set orion.staff;
   Increase=Salary*0.10;
   NewSalary=sum(Salary,Increase);
   keep Employee_ID Salary Increase NewSalary;
   format Salary Increase NewSalary comma10.;
run;

proc print data=work.increase label;
run;


/* Exercise 2 */
data work.birthday;
   set orion.customer;
   Bday2009=mdy(month(Birth_Date),day(Birth_Date),2009);
   BdayDOW2009=weekday(Bday2009);
   Age2009=(Bday2009-Birth_Date)/365.25;
   * or...
   Age2009=yrdif(Birth_Date,Bday2009);
   keep Customer_Name Birth_Date Bday2009 BdayDOW2009 Age2009;
   format Bday2009 date9. Age2009 3.;
run;

proc print data=work.birthday;
run;


/* Exercise 3 */
data work.employees;
   set orion.sales;
   FullName=catx(' ',First_Name,Last_Name);
   Yrs2012=intck('year',Hire_Date,'01JAN2012'd);
   format Hire_Date ddmmyy10.;
   label Yrs2012='Years of Employment in 2012';
run;

proc print data=work.employees label;
   var FullName Hire_Date Yrs2012;
run;


/* Exercise 4 */
data work.region;
   set orion.supplier;
   length Region $ 17;
   if Country in ('CA','US') then do;
      Discount=0.10;
      DiscountType='Required';
      Region='North America';
   end;
   else do;
      Discount=0.05;
	  DiscountType='Optional';
      Region='Not North America';
   end;
   keep Supplier_Name Country 
        Discount DiscountType Region ;
run;

proc print data=work.region;
run;


/* Exercise 5 */
data work.ordertype;
   set orion.orders;
   length Type $ 13 SaleAds $ 5;
   DayOfWeek=weekday(Order_Date);
   if Order_Type=1 then do;
      Type='Catalog Sale';
      SaleAds='Mail';
   end;
   else if Order_Type=2 then do;
      Type='Internet Sale';
	  SaleAds='Email';
   end;
   else if Order_Type=3 then do;
      Type='Retail Sale';
   end;
   drop Order_Type Employee_ID Customer_ID;
run;

proc print data=work.ordertype;
run;


/* Exercise 6 */
data work.gifts;
   set orion.nonsales;
   length Gift1 Gift2 $ 15;
   select(Gender);
     when('F') do;
       Gift1='Perfume';
	   Gift2='Cookware';
     end;
     when('M') do;
	   Gift1='Cologne';
	   Gift2='Lawn Equipment';
     end;
	 otherwise do;
	   Gift1='Coffee';
	   Gift2='Calendar';
     end;
   end;
   keep Employee_ID First Last Gift1 Gift2;
run;  

proc print data=gifts;
run;


/* Exercise 7 */
data work.increase;
   set orion.staff;
   where Emp_Hire_Date>='01JUL2006'd;
   Increase=Salary*0.10;
   if Increase>3000;
   NewSalary=sum(Salary,Increase);
   keep Employee_ID Emp_Hire_Date Salary Increase NewSalary;
   format Salary Increase NewSalary comma10.;
run;

proc print data=work.increase label;
run;


/* Exercise 8 */
data work.delays;
   set orion.orders;
   where Order_Date+4<Delivery_Date 
         and Employee_ID=99999999;
   Order_Month=month(Order_Date);
   if Order_Month=8;
run;

proc print data=work.delays;
run;


/* Exercise 9 */
data work.bigdonations;
   set orion.employee_donations;
   Total=sum(Qtr1,Qtr2,Qtr3,Qtr4);
   NoDonation=nmiss(Qtr1,Qtr2,Qtr3,Qtr4);
   if Total < 50 or NoDonation > 0 then delete;
run;

proc print data=work.bigdonations;
   var Employee_ID Qtr1 Qtr2 Qtr3 Qtr4 Total NoDonation;
run;

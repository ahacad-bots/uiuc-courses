*** s108d09c ***;

proc sql;
   alter table Payroll
      add Date_Last_Raise date, Promotion_Date date;
   update Payroll
      set Promotion_Date=Hire_Date+180
      where Term_Date is missing and today()-180 ge Hire_Date; 
   update Payroll
      set Date_Last_Raise=Promotion_Date+180
      where Term_Date is missing and today()-180 ge Promotion_Date; 
;
quit;

 *** s105d19 ***;

   /* Traditional SAS Program Code */
   /* for Complex Join             */

  /**********************************************************
   Step 1:  Identify the employees who sold Expedition Zero
            merchandise in 2003.
   *********************************************************/
proc sort data=orion.Order_Fact
            (keep=Product_ID Employee_ID Order_Date
            where=(YEAR(Order_Date)=2003 and Employee_ID ne 99999999))
            out=Orders_2007 (Drop=Order_Date);
   by Product_ID;
run;
proc sort data=orion.Product_dim (keep=Product_ID Product_Name)
          out=Products;
   by Product_ID;
run;
data Employees (Keep=Employee_ID);
   merge Orders_2007 (In=KeepMe)
         Products (where=(Product_Name contains 'Expedition Zero'));
   by Product_ID;
   if KeepMe and Product_Name ne '';
run;

proc sort data=Employees nodup;
   by Employee_ID;
run;

  /**********************************************************
   Step 2:  Find the employee identifier for the managers of
            these employees
   *********************************************************/
data Manager_ID (rename=(Manager_ID=Employee_ID));
   merge Employees (in=KeepMe)
         orion.Employee_Organization (keep=Employee_ID Manager_ID);
   by Employee_ID;
   if KeepMe;
   drop Employee_ID;
run;
proc sort data=Manager_ID nodup;
   by Employee_ID;
run;

  /**********************************************************
   Step 3:  Obtain the managers' names and city information
   *********************************************************/
proc sort data=orion.Employee_Addresses (Keep=Employee_ID Employee_Name City)
          out=Employees;
   by Employee_ID;
run;

data Managers;
   length Manager $28.;
   merge Manager_ID (in=KeepMe)
         Employees;
   by Employee_ID;
   if KeepMe;
   Manager=catx(' ',scan(Employee_Name,2,','), 
           scan(Employee_Name,1,','));
   drop Employee_ID Employee_Name;
run;
proc print data=Managers noobs;
run;

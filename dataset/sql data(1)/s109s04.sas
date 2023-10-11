*** s109s04 ***;

proc sql;
   create table work.Products as
      select distinct * 
         from orion.Product_DIM
         order by Product_ID
;
quit;

  /* a. */
proc sql;
   update work.Products
      set Product_Name ="Sunfit Speedy Swimming Trunks"
      where Product_id=210200200022
   ;
quit;

  /* b. */
  /* Method 1 */
proc sql;
   insert into work.Products(Product_ID,Product_Line, 
               Product_Category, Product_Group, 
               Product_Name ,Supplier_Country, 
               Supplier_Name, Supplier_ID)
      values(240600100202,"Sports","Swim Sports","Snorkel Gear",
             "Coral Dive Mask - Med","AU","Dingo Divers",21001)
      values(240600100203,"Sports","Swim Sports","Snorkel Gear",
             "Coral Dive Mask - Large","AU","Dingo Divers",21001)
      values(240600100212,"Sports","Swim Sports","Snorkel Gear",
             "Coral Dive Fins - Med","AU","Dingo Divers",21001)
      values(240600100213,"Sports","Swim Sports","Snorkel Gear",
             "Coral Dive Fins - Large","AU","Dingo Divers",21001)
      values(240600100222,"Sports","Swim Sports","Snorkel Gear",
             "Coral Advanced Snorkel","AU","Dingo Divers",21001)
      values(240600100223,"Sports","Swim Sports","Snorkel Gear",
             "Coral Pro Snorkel","AU","Dingo Divers",21001)
   ;
quit;

  /* Method 2 */
proc sql;
   insert into work.Products 
      set Product_ID=240600100202,Product_Line="Sports",
          Product_Category="Swim Sports",Product_Group="Snorkel Gear",
          Product_Name="Coral Dive Mask - Med", Supplier_Country="AU",
          Supplier_Name="Dingo Divers",Supplier_ID=21001
      set Product_ID=240600100203,Product_Line="Sports",
          Product_Category="Swim Sports",Product_Group="Snorkel Gear",
          Product_Name="Coral Dive Mask - Large", Supplier_Country="AU",
          Supplier_Name="Dingo Divers",Supplier_ID=21001
      set Product_ID=240600100212,Product_Line="Sports",
          Product_Category="Swim Sports",Product_Group="Snorkel Gear",
          Product_Name="Coral Dive Fins - Med", Supplier_Country="AU",
          Supplier_Name="Dingo Divers",Supplier_ID=21001
      set Product_ID=240600100213,Product_Line="Sports",
          Product_Category="Swim Sports",Product_Group="Snorkel Gear",
          Product_Name="Coral Dive Fins - Large", Supplier_Country="AU",
          Supplier_Name="Dingo Divers",Supplier_ID=21001
      set Product_ID=240600100222,Product_Line="Sports",
          Product_Category="Swim Sports",Product_Group="Snorkel Gear",
          Product_Name="Coral Advanced Snorkel",Supplier_Country="AU",
          Supplier_Name="Dingo Divers",Supplier_ID=21001
      set Product_ID=240600100223,Product_Line="Sports",
          Product_Category="Swim Sports",Product_Group="Snorkel Gear",
          Product_Name="Coral Pro Snorkel", Supplier_Country="AU",
          Supplier_Name="Dingo Divers",Supplier_ID=21001
   ;
quit;

  /* c. */
proc sql;
   drop table work.Products;
quit;

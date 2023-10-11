/*******************************
***   Homework 4 Solutions   ***
*******************************/

option nodate pageno=1 center ls=96 ;
ods pdf file='C:\440\hw04\hw04 solution Sp17.pdf';
libname hw04 'C:\440\hw04';

title 'Homework 4 Report';

/* Exercise 1 */
/*a*/
data rushing;
   infile 'C:\440\hw04\nflrush.dat' firstobs=2;
   input @3 Season 4.
        @13 Player $30.
		@43 Team   $3.
	    @67 Yds    comma8.0
		@75 Avg    8.
		@91 Lg	   8.
		@99 TD	   8.
	   @107 FD	   8. ;  
   /* You shouldn't read in Gms, Att, and YPG.
	  You should just jump past them. */
   format Yds comma7.0
          Avg 6.2;
   label Yds='Total Yards'
		 Avg='Yards per Attempt'
		 Lg='Longest Rush'
		 TD='Touchdowns'
		 FD='First Downs';
run;

/*b*/
title2 'Part 1b';
proc contents data=rushing;
run;

/*c*/
proc sort data=rushing out=mostTDs;
   by descending TD;
   where 2013 <= Season <= 2015;
run;
proc print data=mostTDs (obs=10);
   var Player TD Season;
run;

/*d*/
/* A review of the INPUT statement documentation reveals that & is another
   tool for reading in data with imbedded delimiters. */
data localnfl;
   infile 'C:\440\hw04\nflrush_quotes.dat' dlm=' "' firstobs=2 ;
   input Season Player & :$30. Team :$3. @;
   if Team in ('Stl' 'Chi' 'Ind' 'GB');
   input Gms Att Yds :comma8.0 Avg YPG Lg TD FD ;
   drop Gms Att YPG; 
   format Yds comma7.0
          Avg 6.2;
   label Yds='Total Yards'
		 Avg='Yards per Attempt'
		 Lg='Longest Rush'
		 TD='Touchdowns'
		 FD='First Downs';
run;

/*e*/
title2 'Part 1e';
proc contents data=localnfl;
run;

/*f*/
proc sort data=localnfl out=mostYds;
   by descending Yds;
run;
proc print data=mostYds (obs=10);
   var Player Team Yds Season;
run;



/* Exercise 2 */
/*a*/
/* Most efficient option because you're subsetting, then reading all values. */
data low_earners4;
   infile 'C:\440\hw04\employee_roster4.dat' dlm="*" missover;
   input #2 @'**' Department :$40.  
         #3 Salary :dollar12. @;
   if 0 <= Salary < 25000 and Department = "Sales";
   /* You need the 0 <= to avoid including missing values. */
   input #1 ID Name :$40. Country :$2. 
         #2 Company :$30. Department :$40. Section :$40. Org_Group :$40. Job_Title :$25. Gender :$1. 
         #3 Salary :dollar12. BirthDate HireDate TermDate;
   label BirthDate = "Employee Birth Date"
         Country = "Employee Country"
         Gender = "Employee Gender"
         HireDate = "Employee Hire Date"
         ID = "Employee ID"
         Name = "Employee Name"
         Job_Title = "Job Title"
         Org_Group = "Group";
   format BirthDate HireDate TermDate mmddyy10.
          Salary dollar10.;
run;

/* Alternate solution but far less efficient because you're reading in all values, then subsetting. */
/*
data low_earners4;
   infile "employee_roster4.dat" dlm="*" ;
   input ID Name :$40. Country :$2. 
       / Company :$30. Department :$40. Section :$40. Org_Group :$40. Job_Title :$25. Gender :$1. 
         Salary :dollar12. BirthDate HireDate;
   if 0 <= Salary < 25000 and Department = "Sales";
run;
*/

/*b*/
title2 'Part 2b';
proc contents data=low_earners4;
run;

/*c*/
title2 'Part 2c';
proc print data=low_earners4 label;
   var Name Gender Department Job_Title Salary;
run;




title;
ods pdf close;

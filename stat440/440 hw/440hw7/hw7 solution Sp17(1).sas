/*******************************
***   Homework 7 Solutions   ***
*******************************/

option nodate pageno=1 center ls=96 ;
ods rtf file='C:\440\hw7\hw7 solution Sp17.rtf';
libname hw7 'C:\440\hw7';

title 'Homework 7 Report';


/* Exercise 1 */

/*a*/
title2 'Part 1a';
proc freq data=hw7.nonsales noprint;
   table Employee_ID / out=duplicates(where=(count > 1) keep=Employee_ID Count);
run;
proc print data=duplicates;
run;

/*b*/
title2 'Part 1b';
proc sort data=hw7.nonsales out=nonsales_sort;
   by Employee_ID;
run;
proc sort data=duplicates;
   by Employee_ID;
run;

data dupEmployees;
   merge nonsales_sort duplicates(in=inDUP);
   by Employee_ID;
   keep Employee_ID First Last;
   if inDUP;
run;
proc print data=dupEmployees;
run;


/* Exercise 2 */

/*a*/
data rushing;
   infile 'nflrush.dat' firstobs=2;
   input @3 Season 4.
        @13 Player $30.
		@43 Team   $3.
		@57 Games  2.
		@63 Att    4.
	    @70 Yds    comma5.0
		 +1 Avg    7.
		 +1 YPG    7.
		 +1 Lg	   7.
		 +1 TD	   7.
		 +1 FD	   7. ;  
   /* or... */
   *input @3 Season 4.
        @13 Player $30.
		@43 Team   $3.
		@57 Games  2.
		@63 Att    4.
	    @70 Yds    comma5.0
		@75 Avg    8.
		@83 YPG    8.
		@91 Lg	   8.
	    @99 TD	   8.
	   @107 FD	   8. ;
   if Team="Jax" then Team="Jac"; /* or... "Jac" into "Jax" */
   format Yds comma7.0
          Avg 6.2;
   label Att = 'Attempts'
		 Yds = 'Total Yards'
		 Avg = 'Yards per Attempt'
		 Lg  = 'Longest Rush'
		 TD  = 'Touchdowns'
		 FD  = 'First Downs';
run;

/*b*/
title2 'Part 2b';
proc contents data = rushing;
run;

/*c*/
title2 'Part 2c';

/* Option 1 */
proc sort data = rushing;
   by Team Player;
run;
data rushing_totals;
   set rushing;
   by Team Player;
   if first.Player then do;
      Count = 0;
	  TotalYards = 0;
	  end;
   Count + 1;
   TotalYards + Yds;
   if last.Player;
   keep Team Player Count TotalYards;
   label Count = "Number of Seasons"
         TotalYards = "Total Yards";
run;
data mostrushing;
   length bestPlayer $ 30;
   set rushing_totals;
   by Team;
   retain bestPlayer maxYards Seasons;
   if first.Team then do;
      bestPlayer = Player;
	  maxYards = TotalYards;
	  Seasons = Count;
	  end;
   if TotalYards > maxYards then do;
      bestPlayer = Player;
      maxYards = TotalYards;
	  Seasons = Count;
      end;
   if last.Team;
   keep Team bestPlayer Seasons maxYards;
   label bestPlayer = "Player"
         maxYards = "Total Yards"
         Seasons = "Number of Seasons";
run;
proc sort data=mostrushing;
   by descending maxYards;
run;
proc print data=mostrushing noobs label;
   var Team bestPlayer Seasons maxYards;
run;


/* Option 2 */
proc means data=rushing nway noprint;
   class Team Player;
   var Yds;
   output out=rushing_totals
          sum=TotalYards;
run;
proc means data=rushing_totals nway noprint;
   class Team;
   var TotalYards;
   output out=rushing_max (drop=_TYPE_ _FREQ_)
   		  max=MaxYards;
run;
data mostrushing;
   merge rushing_totals rushing_max;
   by Team;
   if TotalYards=MaxYards;
   keep Team Player _FREQ_ TotalYards;
   label _FREQ_="Number of Seasons";
run;
proc sort data=mostrushing;
   by descending TotalYards;
run;
/*
proc print data=mostrushing noobs label;
run;
*/

/* Option 3...if you know SQL */
/*
proc sql;
select distinct r.Team, r.Player, Seasons "Number of Seasons", max(TotalYards) "Total Yards"
   from rushing as r,
       (select Team, Player, count(*) as Seasons, sum(Yds) as TotalYards
	       from rushing
           group by Team, Player) as t
   where r.Team = t.Team and
         r.Player = t.Player
   group by r.Team
   having TotalYards = max(TotalYards)
   order by 4 desc

   ;
quit;
*/


title;
ods rtf close;

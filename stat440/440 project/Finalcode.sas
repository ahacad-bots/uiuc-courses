/* Stat 440 Final Project */

libname final 'C:/440/Final Project';
ods rtf file = 'C:/440/Final project/Final.rtf';

/*
Input the data from the csv file, creating a raw data set
Add appropriate lengths, labels, formats
*/
data rawcomb;
	infile 'C:/440/Final Project/combine.csv' dlm = ',' dsd missover firstobs = 2;
	length name first last college $30. position $3. pick $10.;
	input	year
			name $
			first $
			last $
			position $
			feet
			inches
			httot
			weight
			arms
			hands
			fortyyd
			twentyyd
			tenyd
			twentyss
			threecone
			vertical
			broad
			bench
			round
			college $
			pick $
			pround
			ptotal
			wonderlic
			nflgrade;
	format	arms
			hands
			fortyyd
			twentyyd
			tenyd
			twentyss
			threecone 8.2
			bench
			vertical
			nflgrade 8.1
			httot
			inches 2.;
	label 	fortyyd = '40 Yard Dash (sec)'
			tenyd = '10 Yard Dash (sec)'
			twentyyd = '20 Yard Dash (sec)'
			twentyss = '20 Yard Short Shuttle (sec)'
			threecone = '3-cone Drill (sec)'
			vertical = 'Vertical Jump (in)'
			broad = 'Broad Jump (in)'
			bench = 'Number of repititions on bench press'
			wonderlic = 'Score on Wonderlic standardized exam'
			nflgrade = 'NFL draft rating of player (0-10)';
run;

/* test
proc print data = rawcomb (obs = 10) label;
run;
*/





/* Data validation */

/* 
Players with a suffix have their names read incorrectly, bumping the correct values backwards
We can check for this by looking for observations missing heightfeet AND heightinches AND pick
*/
proc print data = rawcomb;
	where feet = .  AND inches = . AND pick = '0';
run;
/*
Players who have values of 0 for twentyss, broad, and threecone are basically observations with missing data, and can be a subset
*/
proc print data = rawcomb;
	where twentyss = 0 AND broad = 0 AND threecone = 0 AND vertical = 0;
run;
/*
Players who are missing colleges need further attention, and can be a subset
*/
proc print data = rawcomb;
	where college = ' ';
run;
/*
Players who have incorrect height totals according to the values of feet and inches
*/
proc print data = rawcomb;
	where httot ne (feet*12 + inches);
run;




/* Data cleaning */

/* Refined data set */
data combine;
	set rawcomb;
	/* Code to fix suffix */
	if name = 'Mario Edwards' then do;
		name = 'Mario Edwards Jr.';
		first = 'Mario';
		last = 'Edwards';
		position = 'DT';
		feet = 6;
		inches = 3;
		httot = 75;
		weight = 279;
		arms = 0;
		hands = 0;
		fortyyd = 4.84;
		twentyyd = 0;
		tenyd = 0;
		twentyss = 4.55;
		threecone = 7.44;
		vertical = 32.5;
		broad = 120;
		bench = 32;
		round = 0;
		college = 'Florida St.';
		pick = '';
		pround = 0;
		ptotal = 0;
		wonderlic = 0;
		nflgrade = 5.6;
	end;
	else if name = 'Dante Fowler' then do;
		name = 'Dante Fowler Jr.';
		first = 'Dante';
		last = 'Fowler';
		position = 'OLB';
		feet = 6;
		inches = 3;
		httot = 75;
		weight = 261;
		arms = 0;
		hands = 0;
		fortyyd = 4.6;
		twentyyd = 0;
		tenyd = 0;
		twentyss = 4.32;
		threecone = 7.4;
		vertical = 32.5;
		broad = 112;
		bench = 19;
		round = 0;
		college = 'Florida';
		pick = '';
		pround = 0;
		ptotal = 0;
		wonderlic = 0;
		nflgrade = 6.4;
	end;
	/* Code to fix invalid height calculations */
	if httot ~= feet*12 + inches then
		httot = feet*12 + inches;
	/* Fix pick according to the pround and ptotal */
	do i = 1 to 4947;
		pick = cat(pround,'(' , ptotal , ')');
	end;
	drop i;
	/* OC and C are two names for the same position */
	if position = 'OC' then position = 'C';
run;

/* testing
proc print data = combine (obs = 700);
run;
*/




/* Re-validating data */
/* Check for suffix errors */
proc print data = combine;
	where feet = .  AND inches = . AND pick = '0';
run;
/* Players who have incorrect height totals according to the values of feet and inches */
proc print data = combine;
	where httot ne (feet*12 + inches);
run;




/* Manipulating data, subsetting, etc */


proc freq data = combine;
	tables arms hands twentyyd tenyd threecone wonderlic nflgrade college/ nocum;
run;

/* Subset observations with lots of missing numeric values */
data missingdat;
	set combine;
	if twentyss = 0 AND broad = 0 AND threecone = 0 AND vertical = 0 then output;
run;

/* Subset players missing college information */
data collegemiss;
	set combine;
	if college = ' ' then output;
run;

/* Create a subset of all the players with Position Right Back */	
data RBPlayers;
	set combine;
	if position = 'RB' then output;
run;

/* Create a subset of all players who belong to year 2015 */
data Year2015;
	set combine;
	if year = 2015 then output;
run;

/* Create a subset of all players who belong to year 2014 */
data Year2014;
	set combine;
	if year = 2014 then output;
run;

/* Create a subset of all players whose height is greater than or equal to 6 feet */
data Height6Plus;
	set combine;
	if httot >= 72 then output;
run;

/* Print name of the players with nflgrade greater than or equal to 5.8 */
proc print data = combine noobs;
	title1 "Players With nflgrade Greater Than or Equal to 5.8";
	where nflgrade >= 5.8;
	var name nflgrade;
run;
	
/* Merge the datasets Year2015 and Year2014 to find all the players for 2014 and 2015 */
data merged2014and2015;
	set year2014 year2015;
run;

ods rtf close;

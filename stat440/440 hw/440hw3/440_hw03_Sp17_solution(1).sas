/*******************************
***   Homework 3 Solutions   ***
*******************************/

option nodate pageno=1 center ls=96 ;
ods pdf file='C:\440\hw03\hw03 solution Sp17.pdf';
libname hw03 'C:\440\hw03';

title 'Homework 3 Report';

/* Exercise 1 */
/*a*/
proc format library=hw03;
   value $statefmt 'NSW' = 'New South Wales'
                   'VIC' = 'Victoria'
				   'QLD' = 'Queensland' ;

   value $sexfmt 'M' = 'Male'
                 'F' = 'Female' ;

   value $statusfmt 'A' = 'Alive'
   					'D' = 'Dead' ;
run;

option fmtsearch=(hw03);

/*b*/
data hw03.AUaids;
   infile 'C:\440\hw03\AUaids.dat';
   input Obs State :$5. Sex :$1. DiagnosisDate EndDate EndStatus :$1. Category :$5. DiagnosisAge;
   format DiagnosisDate EndDate mmddyy10.
		  State $statefmt.
		  Sex $sexfmt.
		  EndStatus $statusfmt.;
   label State="State of Origin"
		 DiagnosisDate="Diagnosis Date"
		 EndDate="Death/End Date"
		 Category="Transmission Category"
		 DiagnosisAge="Age at Diagnosis";
run;

/*c*/
title2 'Part 1c';
proc print data=hw03.AUaids(obs=10) label noobs;
   where State = 'QLD';
run;

/*d*/
data hw03.under26;
   infile 'C:\440\hw03\AUaids.dat';
   input Obs State :$5. Sex :$1. DiagnosisDate EndDate EndStatus :$1. Category :$5. DiagnosisAge;
   if Sex='M' and DiagnosisAge<26 and Category="blood";
   format DiagnosisDate EndDate mmddyy10.
		  State $statefmt.
		  Sex $sexfmt.
		  EndStatus $statusfmt.;
   label State="State of Origin"
		 DiagnosisDate="Diagnosis Date"
		 EndDate="Death/End Date"
		 Category="Transmission Category"
		 DiagnosisAge="Age at Diagnosis";
run;

/*e*/
title2 'Part 1e';
proc print data=hw03.under26 label noobs;
run;



/* Exercise 2 */
/*a*/

/* A more advanced solution would utilize this format... */
proc format;
	value sleep_fmt  -999 = Missing
					other = [6.1];
run;


data sleep_NetID;
	infile "C:\440\hw03\sleep.dat" dlm=',';
	length Species $ 25;
	input Species $ BodyWt BrainWt Slow Para Total LifeSpan Gestation Pred Exposure Danger;
	format BodyWt BrainWt comma7.2 Slow Para Total sleep_fmt.;
	*format BodyWt BrainWt comma7.2 Slow Para Total 6.1;
	label Species="Animal Species" 
          BodyWt="Body Weight" 
          BrainWt="Brain Weight"
		  Slow="Nondreaming Sleep" 
          Para="Dreaming Sleep"
		  Total="Total Sleep" 
          LifeSpan="Life Span"
		  Gestation="Gestation Time" 
          Pred="Predation Index"
		  Exposure="Sleep Exposure Index" 
          Danger="Overall Danger Index";
run;

/*b*/
title2 'Part 2b';
proc contents data=sleep_NetID;
run;

/*c*/
data big_NetID;
	set sleep_NetID;
	where BodyWt >= 150 and BrainWt > 80;
	keep Species BodyWt BrainWt;
run;

/*d*/
title2 'Part 2d';
proc print data=big_NetID label noobs;
run;

/*e*/
data nottired_NetID;
	set sleep_NetID;
	where (Slow lt 6 and Slow ne -999) or (Total lt 6 and Total ne -999);
	keep Species Slow Para Total;
run;

/*f*/
title2 'Part 2f';
proc print data=nottired_NetID label noobs;
run;




title;
ods pdf close;

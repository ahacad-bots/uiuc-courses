/* Solution code for Homework 1 in Stat 448 sections A1 and C1 at 
   University of Illinois, Spring 2017 */
ods html close; 
options nodate nonumber;
title;
ods rtf file='C:\Stat 448\HW1_Sp17_Solution.rtf' 
	nogtitle startpage=no;
ods noproctitle; 
/* Fisher (1936) Iris Data */
* Exercise 1;
* a;
proc boxplot data=sashelp.iris;
	plot petallength*species;
run;
* b;
proc univariate data=sashelp.iris normal;
	var petallength;
	histogram petallength/ normal;
	probplot petallength;
	ods select Moments BasicMeasures Histogram ProbPlot TestsForNormality;
run;
/* c */
proc univariate data=sashelp.iris normal;
	var petallength;
	histogram petallength /normal;
	probplot petallength;
	by species;
	ods select Moments BasicMeasures Histogram ProbPlot TestsForNormality;
run;
* Exercise 2;
* a;
proc univariate data=sashelp.iris mu0=45;
	var petallength;
	ods select TestsForLocation;
run;
* b;
proc ttest data=sashelp.iris h0=43.5 sides=u;
	var petallength;
	where species = 'Virginica';
	ods select TTests;
run;
* c;
proc ttest data=sashelp.iris;
	class species;
	var petallength;
	where species ne'Setosa';
	ods select ConfLimits Equality TTests;
run;
* Exercise 3;
* a;
proc corr data=sashelp.iris;
	where Species ne 'Setosa';
	ods select PearsonCorr; 
run;
* b;
proc corr data=sashelp.iris; 
	by species;
	where Species ne 'Setosa';
	ods select PearsonCorr;
run;
ods rtf close;
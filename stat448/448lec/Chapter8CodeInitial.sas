* ods html close; 
* ods preferences;
* ods html newfile=proc;
data ghq;
  infile 'c:\Stat 448\ghq.dat' expandtabs;
  input ghq sex $ cases noncases;
  total=cases+noncases;
  prcase=cases/total;
run;
proc print data=ghq;
run;
* scatter plot of case probability vs. ghq score;
proc sgplot data=ghq;
  scatter y=prcase x=ghq;
run;
* fit logistic model as a function of ghq score, and save predicted 
  probabilities to a data set so we can plot the prediction easily;
proc logistic data=ghq noprint;
   model cases/total=ghq;
   output out=lout p=lpred;
run;
* sort predictions by questionnaire score because sgplot will plot 
  the points in the order given;
proc sort data=lout;
  by ghq;
run;
proc print data=lout;
run;
* plot probabilities predicted by logistic regression and include 
  a linear regression line via the reg statement for comparison;
proc sgplot data=lout;
 series y=lpred x=ghq / legendlabel='Logistic';
 reg y=prcase x=ghq / legendlabel='Linear' lineattrs=(pattern=dash);
run;
* logistic model as a function of just ghq;
proc logistic data=ghq;
	model cases/total=ghq;
run;
* logistic model as a function of just ghq but extracting some useful info;
proc logistic data=ghq;
	model cases/total=ghq;
	ods select OddsRatios ParameterEstimates 
		GlobalTests ModelInfo FitStatistics;
run;
* scatter plot of case probability vs. ghq score by sex;

* logistic model as a function of sex and ghq;

* reference coding instead;

data plasma;
  infile 'c:\Stat 448\plasma.dat';
  input fibrinogen gamma esr;
run;
proc print data=plasma;
run;
* use desc option to consider probability of 1's rather than probability of 0's;

/* insert plasma logistic modeling here */

* use the final model to predict probabilities;

* use the final model to see model performance;

data diy;
  infile 'c:\Stat 448\diy.dat' expandtabs;
  input y1-y6 / n1-n6;
  length work $9.;
  work='Skilled';
  if _n_ > 2 then work='Unskilled';
  if _n_ > 4 then work='Office';
  if _n_ in(1,3,5) then tenure='rent';
                   else tenure='own';
  array yall {6} y1-y6;
  array nall {6} n1-n6;
  do i=1 to 6;
    if i>3 then type='house';
	       else type='flat';
    agegrp=1;
	if i in(2,5) then agegrp=2;
	if i in(3,6) then agegrp=3;
    yes=yall{i};
	no=nall{i};
	total=yes+no;
	prdiy=yes/total;
	output;
  end;
  drop i y1--n6;
run;
proc print data=diy;
run;
* get cross-tabulation of "yes" probability;
proc tabulate data=diy order=data;
 class work tenure type agegrp;
 var prdiy;
 table work*tenure all,
       (type*agegrp all)*prdiy*mean;
run;
* logistic regression of yes probability using reference dummy variable coding 
  for work and using the first value in alphabetically order as the reference;

* use all main effects, and use reference coding for each classification variable 
  taking the first value in alphanumeric order as the reference;

* use backward selection on all main effects with same coding as before;


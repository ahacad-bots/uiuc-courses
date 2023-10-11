/*******************************
***   Homework 2 Solutions   ***
*******************************/

option nodate pageno=1 center ls=96 ;
ods pdf file='C:\440\hw02\hw02 solution Sp17.pdf';
libname hw02 'C:\440\hw02';


/* Exercise 1 */
/*a*/
title2 'Part 1a';
proc contents data=hw02.fmli142;
run;
proc contents data=hw02.memi142;
run;

/*b*/
proc format;
   value $BLS_URBNfmt '1'=Urban
                      '2'=Rural
                      " "='Missing'
                      other='Miscoded';
   value $REGIONfmt '1'=Northeast
                    '2'=Midwest
                    '3'=South
                    '4'=West
                    " "='Missing'
                    other='Miscoded';
   value $INCLASSfmt '01'='Less than $5,000'
                     '02'='$5,000 to $9,999'
                     '03'='$10,000 to $14,999'
                     '04'='$15,000 to $19,999'
                     '05'='$20,000 to $29,999'
                     '06'='$30,000 to $39,999'
                     '07'='$40,000 to $49,999'
                     '08'='$50,000 to $69,999'
                     '09'='$70,000 and over'
                     " "='Missing'
                     other='Miscoded';
   value $STATEfmt  '01'=Alabama                '29'=Missouri
                    '02'=Alaska                 '30'=Montana
                    '04'=Arizona                '31'=Nebraska
                    '05'=Arkansas               '32'=Nevada
                    '06'=California             '33'=New Hampshire
                    '08'=Colorado               '34'=New Jersey
                    '09'=Connecticut            '36'=New York
                    '10'=Delaware               '37'=North Carolina
                    '11'=District of Columbia   '39'=Ohio
                    '12'=Florida                '40'=Oklahoma
                    '13'=Georgia                '41'=Oregon
                    '15'=Hawaii                 '42'=Pennsylvania
                    '16'=Idaho                  '44'=Rhode Island
                    '17'=Illinois               '45'=South Carolina
                    '18'=Indiana                '46'=South Dakota
                    '20'=Kansas                 '47'=Tennessee
                    '21'=Kentucky               '48'=Texas
                    '22'=Louisiana              '49'=Utah
                    '23'=Maine                  '51'=Virginia
                    '24'=Maryland               '53'=Washington
                    '25'=Massachusetts
                    " "='Missing'
                    other='Miscoded';
   value $INCLASS2fmt   '1'='Less than 0.1667'
                        '2'='0.1667 – 0.3333'
                        '3'='0.3334 – 0.4999'
                        '4'='0.5000 – 0.6666'
                        '5'='0.6667 – 0.8333'
                        '6'='0.8334 – 1.0000'
                        " "='Missing'
                        other='Miscoded';
   value $EDUCfmt   '00'=Never attended school
                    '10'=First through eighth grade
                    '11'='Ninth through twelfth grade (no H.S. diploma)'
                    '12'='High school graduate'
                    '13'='Some college, less than college graduate'
                    '14'="Associate's degree (occupational/vocational or academic)"
                    '15'="Bachelor's degree"
                    '16'="Master's degree, (professional/Doctorate degree)"
                    " "='Missing'
                    other='Miscoded';
   value $MARITALfmt '1'=Married
                     '2'=Widowed
                     '3'=Divorced
                     '4'=Separated
                     '5'=Never married
                     " "='Missing'
                     other='Miscoded';
   value $RACEfmt   '1'=White
                    '2'=Black
                    '3'=Native American
                    '4'=Asian
                    '5'=Pacific Islander
                    '6'='Multi-race'
                    " "='Missing'
                    other='Miscoded';
   value $SEXfmt    '1'=Male
                    '2'=Female
                    " "='Missing'
                    other='Miscoded';
   value $CU_CODEfmt    '1'=Reference person
                        '2'=Spouse
                        '3'=Child or adopted child
                        '4'=Grandchild
                        '5'='In-law'
                        '6'=Brother or sister
                        '7'=Mother or father
                        '8'=Other related person
                        '9'=Unrelated person
                        '0'=Unmarried Partner
                        " "='Missing'
                        other='Miscoded';
   value $EDUCAfmt  '1'='No schooling completed, or less than 1 year'
                    '2'='Nursery, kindergarten, and elementary (grades 1-8)'
                    '3'='High school (grades 9-12, no degree)'
                    '4'='High school graduate – high school diploma or the equivalent (GED)'
                    '5'='Some college but no degree'
                    '6'="Associate's degree in college"
                    '7'="Bachelor's degree (BA, AB, BS, etc.)"
                    '8'="Master's professional, or doctorate degree (MA, MS, MBA, MD, JD, PhD, etc.)"
                    " "='Missing'
                    other='Miscoded';
run;

/*c*/
data work.fmli142;
   set hw02.fmli142;
   format BLS_URBN $BLS_URBNfmt.
          REGION $REGIONfmt.
          INCLASS $INCLASSfmt.
          STATE $STATEfmt.
          INCLASS2 $INCLASS2fmt.
          EDUC_REF EDUCA2 $EDUCfmt.
          MARITAL1 $MARITALfmt.
          REF_RACE RACE2 $RACEfmt.
          SEX_REF SEX2 $SEXfmt.
          FINCATAX FINCBTAX dollar12.2;
   label QINTRVMO="Interview month"
         QINTRVYR="Interview year"
         CUID="Consumer Unit ID"
         BLS_URBN="Urban/Rural"
         REGION="Region"
         MARITAL1="Marital status"
         AGE_REF="Age of reference person"
         AGE2="Age of spouse"
         EDUC_REF="Education of reference person"
         EDUCA2="Education of spouse"
         RACE2="Race of spouse"
         REF_RACE="Race of reference person"
         FINCATAX="Income after taxes"
         FINCBTAX="Income before taxes";
run;

data work.memi142;
   set hw02.memi142;
   format CU_CODE $CU_CODEfmt.
          EDUCA $EDUCAfmt.
          MARITAL $MARITALfmt.
          SEX $SEXfmt.
          MEMBRACE $RACEfmt.
          SALARYX dollar12.2;
   label AGE="Age"
         CU_CODE="Relationship to reference person"
         EDUCA="Highest level of education"
         MARITAL="Marital status"
         MEMBRACE="Member's Race"
         SALARYX="Annual Salary/Wages"
         SEX="Sex";
run;

/*d*/
title2 'Part 1d';
proc contents data=fmli142;
run;
proc contents data=memi142;
run;

/*e*/
title2 'Part 1e';
proc print data=fmli142 (obs=10);
   var NEWID CUID AGE_REF BLS_URBN MARITAL1 FINCATAX;
run;
proc print data=memi142 (obs=10);
   var NEWID CU_CODE MARITAL SALARYX;
run;

/*f*/
proc format;
   value sal_fmt low   - 12000    = "Impoverished"
                 12000 <-< 30000  = "Lower Class"
                 30000 - 70000    = "Middle Class"
                 70000 <-< 120000 = "Upper Middle Class"
                 120000 - high    = "Upper Class"
                                . = "Missing" ;
run;

/*g*/
title2 'Part 1g';
ods select none;
proc datasets lib=work;
   modify memi142;
   format SALARYX sal_fmt.;
quit;
ods select all;

/*h*/
title2 'Part 1h';
proc print data=work.memi142 (obs=10);
   var NEWID EDUCA SALARYX;
run;


title;
ods pdf close;
/*******************************
***   Homework 2 Solutions   ***
*******************************/

option nodate pageno=1 center ls=96 ;
ods pdf file='C:\440\hw02\hw02 solution Fa16.pdf';
libname hw02 'C:\440\hw02';


/* Exercise 1 */
/*a*/
title2 'Part 1a';
proc contents data=hw02.fmli142;
run;
proc contents data=hw02.memi142;
run;

/*b*/
proc format;
   value $BLS_URBNfmt '1'=Urban
					  '2'=Rural
					  " "='Missing'
					  other='Miscoded';
   value $REGIONfmt	'1'=Northeast
				    '2'=Midwest
				    '3'=South
				    '4'=West
					" "='Missing'
					other='Miscoded';
   value $INCLASSfmt '01'='Less than $5,000'
					 '02'='$5,000 to $9,999'
					 '03'='$10,000 to $14,999'
					 '04'='$15,000 to $19,999'
					 '05'='$20,000 to $29,999'
					 '06'='$30,000 to $39,999'
					 '07'='$40,000 to $49,999'
					 '08'='$50,000 to $69,999'
					 '09'='$70,000 and over'
					 " "='Missing'
					 other='Miscoded';
   value $STATEfmt	'01'=Alabama 				'29'=Missouri
					'02'=Alaska 				'30'=Montana
					'04'=Arizona 				'31'=Nebraska
					'05'=Arkansas 				'32'=Nevada
					'06'=California 			'33'=New Hampshire
					'08'=Colorado 				'34'=New Jersey
					'09'=Connecticut 			'36'=New York
					'10'=Delaware 				'37'=North Carolina
					'11'=District of Columbia 	'39'=Ohio
					'12'=Florida 				'40'=Oklahoma
					'13'=Georgia 				'41'=Oregon
					'15'=Hawaii 				'42'=Pennsylvania
					'16'=Idaho 					'44'=Rhode Island
					'17'=Illinois 				'45'=South Carolina
					'18'=Indiana 				'46'=South Dakota
					'20'=Kansas 				'47'=Tennessee
					'21'=Kentucky 				'48'=Texas
					'22'=Louisiana 				'49'=Utah
					'23'=Maine 					'51'=Virginia
					'24'=Maryland 				'53'=Washington
					'25'=Massachusetts
				    " "='Missing'
					other='Miscoded';
   value $INCLASS2fmt	'1'='Less than 0.1667'
						'2'='0.1667 – 0.3333'
						'3'='0.3334 – 0.4999'
						'4'='0.5000 – 0.6666'
						'5'='0.6667 – 0.8333'
						'6'='0.8334 – 1.0000'
						" "='Missing'
					    other='Miscoded';
   value $EDUCfmt	'00'=Never attended school
					'10'=First through eighth grade
					'11'='Ninth through twelfth grade (no H.S. diploma)'
					'12'='High school graduate'
					'13'='Some college, less than college graduate'
					'14'="Associate's degree (occupational/vocational or academic)"
					'15'="Bachelor's degree"
					'16'="Master's degree, (professional/Doctorate degree)"
					" "='Missing'
					other='Miscoded';
   value $MARITALfmt '1'=Married
					 '2'=Widowed
					 '3'=Divorced
					 '4'=Separated
					 '5'=Never married
					 " "='Missing'
					 other='Miscoded';
   value $RACEfmt	'1'=White
					'2'=Black
					'3'=Native American
					'4'=Asian
					'5'=Pacific Islander
					'6'='Multi-race'
					" "='Missing'
					other='Miscoded';
   value $SEXfmt	'1'=Male
					'2'=Female
					" "='Missing'
					other='Miscoded';
   value $CU_CODEfmt	'1'=Reference person
						'2'=Spouse
						'3'=Child or adopted child
						'4'=Grandchild
						'5'='In-law'
						'6'=Brother or sister
						'7'=Mother or father
						'8'=Other related person
						'9'=Unrelated person
						'0'=Unmarried Partner
					    " "='Missing'
					    other='Miscoded';
   value $EDUCAfmt	'1'='No schooling completed, or less than 1 year'
					'2'='Nursery, kindergarten, and elementary (grades 1-8)'
					'3'='High school (grades 9-12, no degree)'
					'4'='High school graduate – high school diploma or the equivalent (GED)'
					'5'='Some college but no degree'
					'6'="Associate's degree in college"
					'7'="Bachelor's degree (BA, AB, BS, etc.)"
					'8'="Master's professional, or doctorate degree (MA, MS, MBA, MD, JD, PhD, etc.)"
					" "='Missing'
					other='Miscoded';
run;

/*c*/
data work.fmli142;
   set hw02.fmli142;
   format BLS_URBN $BLS_URBNfmt.
          REGION $REGIONfmt.
		  INCLASS $INCLASSfmt.
          STATE $STATEfmt.
          INCLASS2 $INCLASS2fmt.
          EDUC_REF EDUCA2 $EDUCfmt.
		  MARITAL1 $MARITALfmt.
          REF_RACE RACE2 $RACEfmt.
          SEX_REF SEX2 $SEXfmt.
		  FINCATAX FINCBTAX dollar12.2;
   label QINTRVMO="Interview month"
         QINTRVYR="Interview year"
		 CUID="Consumer Unit ID"
		 BLS_URBN="Urban/Rural"
		 REGION="Region"
		 MARITAL1="Marital status"
		 AGE_REF="Age of reference person"
		 AGE2="Age of spouse"
		 EDUC_REF="Education of reference person"
		 EDUCA2="Education of spouse"
		 RACE2="Race of spouse"
		 REF_RACE="Race of reference person"
		 FINCATAX="Income after taxes"
		 FINCBTAX="Income before taxes";
run;

data work.memi142;
   set hw02.memi142;
   format CU_CODE $CU_CODEfmt.
          EDUCA $EDUCAfmt.
		  MARITAL $MARITALfmt.
          SEX $SEXfmt.
          MEMBRACE $RACEfmt.
		  SALARYX dollar12.2;
   label AGE="Age"
         CU_CODE="Relationship to reference person"
		 EDUCA="Highest level of education"
         MARITAL="Marital status"
		 MEMBRACE="Member's Race"
         SALARYX="Annual Salary/Wages"
		 SEX="Sex";
run;

/*d*/
title2 'Part 1d';
proc contents data=fmli142;
run;
proc contents data=memi142;
run;

/*e*/
title2 'Part 1e';
proc print data=fmli142 (obs=10);
   var NEWID CUID AGE_REF BLS_URBN MARITAL1 FINCATAX;
run;
proc print data=memi142 (obs=10);
   var NEWID CU_CODE MARITAL SALARYX;
run;

/*f*/
proc format;
   value sal_fmt low   - 12000    = "Impoverished"
				 12000 <-< 30000  = "Lower Class"
                 30000 - 70000    = "Middle Class"
				 70000 <-< 120000 = "Upper Middle Class"
				 120000 - high    = "Upper Class"
				                . = "Missing" ;
run;

/*g*/
title2 'Part 1g';
ods select none;
proc datasets lib=work;
   modify memi142;
   format SALARYX sal_fmt.;
quit;
ods select all;

/*h*/
title2 'Part 1h';
proc print data=work.memi142 (obs=10);
   var NEWID EDUCA SALARYX;
run;


title;
ods pdf close;

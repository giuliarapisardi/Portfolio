/* Giulia Rapisardi */
/* Final */
/* Problem 5 */
libname final '/home/u42958307/workdata';

proc import datafile='/home/u42958307/workdata/Midterm_P3_Data.xlsx' 
		out=final.problem_5 dbms=xlsx replace;
run;

data final.problem_5;
	set final.problem_5;
run;

/* Age */
proc reg data=final.problem_5;
	model Reduction=age;
run;

proc corr data=final.problem_5;
	var Reduction age;
run;

proc sgscatter data=final.problem_5;
	plot Reduction * age / datalabel=Reduction group=age;
run;

/* Before */
proc reg data=final.problem_5;
	model Reduction=before;
run;

proc corr data=final.problem_5;
	var Reduction before;
run;

proc sgscatter data=final.problem_5;
	plot Reduction * before / datalabel=Reduction group=before;
run;

/* Gender */
proc glm data=final.problem_5;
	class gender;
	model reduction=gender;
run;

proc sgscatter data=final.problem_5;
	plot Reduction * gender / datalabel=Reduction group=gender;
run;

/* Exercise */
proc npar1way data=final.problem_5;
	class exercise;
	var reduction;
run;

proc sgscatter data=final.problem_5;
	plot Reduction * exercise / datalabel=Reduction group=exercise;
run;


/* Overall Model Significance */
proc reg data=final.problem_5;
	model reduction=age before;
run;

proc corr cov data=final.problem_5; 
	var reduction age before;
run;


/*hypothesis for each predictor */
proc reg data=final.problem_5;
	var age;
	model reduction=age;
run;

proc reg data=final.problem_5;
	var before;
	model reduction=before;
run;

proc glm data=final.problem_5;
	class gender;
	model reduction=gender;
run;

proc glm data=final.problem_5;
	class exercise;
	model reduction=exercise;
run;
libname workdt '/home/u42958307/workdata'; 

proc import 
datafile='/home/u42958307/workdata/Midterm_P3_Data.xlsx'
dbms = xlsx 
out = caloric_intake replace;
run;

data  caloric_intake;
set caloric_intake;

run;


proc means data=caloric_intake;
	var reduction;
	class gender;
run;

proc means data=caloric_intake;
run;


data caloric_intake_in_age_groups;
input age $ reduction;
datalines;
20-30 9.23
20-30 7.56
20-30 5.93
20-30 5.10
20-30 7.23
20-30 8.19
20-30 6.89
20-30 5.47
40-50 4.30
40-50 4.54
40-50 2.84
40-50 4.23
40-50 5.28
40-50 5.92
40-50 2.43
40-50 2.18
40-50 6.92
40-50 7.83
;
run;

proc means data=caloric_intake_in_age_groups mean var;
	var reduction; 
	class age;
run;

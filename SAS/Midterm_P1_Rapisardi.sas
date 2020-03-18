/* Giulia Rapisardi 
Midterm STA 411 */

data problem_1;
input treatment $ score;
datalines;
A 55
A 65
A 72
A 68
A 75
A 80
A 71
A 73 
A 69 
A 78
B 80 
B 81
B 85
B 76
B 98
B 81
B 77
B 91
B 83
B 85
;
run;

proc means data=problem_1;
	var score;
	class treatment;
run;

proc means data=problem_1;
run;

proc ttest data=problem_1;
run;



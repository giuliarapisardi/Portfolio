/* Giulia Rapisardi */
/* Final */


/* Problem 3 */

data problem_3;
input RAA  MS;
datalines;
-.258 29
-.249 30
-.156 33 
-.031 32
 .12  31
 .24  35
 .342 34
 .754 35
;
run;


proc corr  data=problem_3 ALPHA ;
	var RAA MS;
run;


data problem_3_ranks;
input RAA_rank MS_rank;
datalines;
1 1
2 2
3 5
4 4
5 3
6 7
7 6 
8 7
;
run;


proc corr spearman data=problem_3_ranks ALPHA;
	var RAA_rank MS_rank;
run;


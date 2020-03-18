


data problem_2;
input mother child1 child2 child3 child4;
weightmean=mean(child1,child2,child3,child4);
cards;
1 6.4 6.9 6.9 7.1
2 7.5 7.8 8.8 8.4
3 7.6 8.7 9.3 8.2
4 5.3 5.7 5.9 6.1
5 6.2 5.6 6.4 5.5 
6 7.0 7.8 8.6 8.2
;
run;

proc print data=problem_2;
var child1 child2 child3 child4 weightmean;
run;

proc means data=problem_2;
var child1 child2 child3 child4 weightmean;
run;

proc glm data=problem_2;
model child1 child2 child3 child4=/nouni;
repeated child;
run;


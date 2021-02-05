clear all 
clc
close all 

thr = [6	9	27;
 	27	6	24;
 	24	21	27;
 	9	24	18;
	18	12	18];

fc = [250 500 1000 2000 3000];

F = [
730 1090 2440 3781 4200;
270 2290 3010 3781 4200;
300 870 2240 3406 4200];


plot(fc,thr,'*--')
hold on
stem(F(1,:),30*ones(1,5));
hold on
stem(F(2,:),30*ones(1,5));
hold on
stem(F(3,:),30*ones(1,5));
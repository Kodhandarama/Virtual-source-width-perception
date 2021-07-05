clear; 
clc;
close all; 

i = 20;

%seq_idx = randperm(20); 
%save('seq_idx','seq_idx')
load seq_idx2; 

idx = seq_idx2(i); 

path = floor((idx-1)/4) + 1; 
folder = mod(idx-1,4)+1; %[1 2 3 4 5 6 7 8 9] 

[path folder]

name = 'kannan2';



sample_play(path,folder,name,i) 
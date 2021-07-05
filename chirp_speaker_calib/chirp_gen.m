clear variables
clc
close all 

T = 4 ; 
fs_24 = 24000; 
fs_48 = 48000; 

file_1 = strcat('./data/chirp_1_6_12k.wav'); 
file_2 = strcat('./data/chirp_2_6_12k.wav'); 
file_3 = strcat('./data/chirp_3_6_12k.wav'); 
file_4 = strcat('./data/chirp_4_6_12k.wav'); 
file_5 = strcat('./data/chirp_5_6_12k.wav'); 
file_6 = strcat('./data/chirp_6_6_12k.wav'); 
file_7 = strcat('./data/chirp_6_6_12k.wav'); 
% file_r = strcat('./data/chirp_2chn_16b_r.wav'); 
% file_2c = strcat('./data/chirp_2chn_16b.wav'); 

t = [0:T*fs_24-1]/fs_24; 

f0 = 20; 
f1 = 12000; 

% a = polyfit([0  0.5  T],[f0  f1  f0],2) ;
% if1 = polyval(a,t); 

if1 = f0 + 2.^(log2(f1-f0)*t/T);

%if1 = f0 + ((f1-f0)*t/T);

phi1 = cumsum(if1/fs_24)*2*pi; 

x = 0.25 * sin( phi1 ); 
%x_f = filter(b,1,x); 

x_rs =resample(x,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));

x_rs_f = filter(b,1,x_rs); 


y = [zeros(1,1.5*fs_48) 0.5 zeros(1,0.5*fs_48) x_rs_f zeros(1,fs_48) ]; 




z = zeros(1,length(y)); 

sig_1 = [ y' z' z' z' z' z' ]; 
sig_2 = [ z' y' z' z' z' z'  ]; 
sig_3 = [ z' z' y' z' z' z'  ]; 
sig_4 = [ z' z' z' y' z' z'  ]; 
sig_5 = [ z' z' z' z' y' z'  ]; 
sig_6 = [ z' z' z' z' z' y'  ]; 
 

audiowrite(file_1,sig_1,fs_48,'BitsPerSample',16) ;
audiowrite(file_2,sig_2,fs_48,'BitsPerSample',16) ;
audiowrite(file_3,sig_3,fs_48,'BitsPerSample',16) ;
audiowrite(file_4,sig_4,fs_48,'BitsPerSample',16) ;
audiowrite(file_5,sig_5,fs_48,'BitsPerSample',16) ;
audiowrite(file_6,sig_6,fs_48,'BitsPerSample',16) ;


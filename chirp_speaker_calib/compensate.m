clear variables
%close all 
clc

%mat file of lpc co-efficients
% addpath '/home/sag/arthi/Functions/ch3'

file_ir = 'chirp_recording/ls1_chirp_recording_2_channels.wav'; %signal recorded from speakers
file_comp1 = strcat('compensated_stimuli/ls1_mic1mic2_compensated.wav'); % resulting stimuli stored here

mat_file = 'lp_coeff/ls1_mic1mic2_compensated.mat' ; % to store LPC
idx= 1; 
channel = 2;
L = 200; % ?
[s1,res1,fs_48] = fn_ir(file_ir,1,L); % res1 is H(w)
[s2,res2,fs_48] = fn_ir(file_ir,2,L);
s = mean([s1 s2],2); 
res = fft(s,fs_48);
% s =s1; res = res1; 

fs_24 = 24000; % downsampling for LPC

s = resample(s,fs_24,fs_48);
res = fft(s,fs_24);

m= length(s); % required to calculate gain of filter
p = 100; %LP order
[a_ar,sigma] = lpc(s,p);
[res_ar,w]=freqz(sqrt(sigma*m),a_ar,fs_24/2); %(why 12k)
ir = filter(a_ar,sqrt(sigma*m),s); % ir is the inverse filtered response i.e given the output of the filter, we can find the input to the filter
% required to undo the effects of the loudspeaker
close all 
% f = w*f_max/pi; 
f=1:12000;
plot(f,20*log10(abs(res_ar)),'b') % plotting frequency response of the designed filter
hold on 
f = w*fs_24/2/pi; 
plot(f,20*log10(abs(res_ar)),'r')
plot(f,20*log10(abs(res(1:fs_24/2))),'k' )

%%% compensated chirp 


T = 4; 

t = [0:T*fs_24-1]/fs_24; 

f0 = 20; 
f1 = 12000; 
if1 = f0 + 2.^(log2(f1-f0)*t/T);
phi1 = cumsum(if1/fs_24)*2*pi; 
x =  sin( phi1 ); 

x_ar = filter(a_ar,sqrt(sigma*m),x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?


x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 

close all 
subplot(2,1,1)
% title('compensated chirp')
plot(20*log10(abs(fft(x_rs_f))))
axis([0 15000 -100 50])
hold on 
subplot(2,1,2)
plot(20*log10(abs(fft(ir,fs_24))))

axis([0 15000 -100 50])
del_ar = filter(a_ar,sqrt(sigma*m),[1 zeros(1,500)]); 
del_ir = 0.5*del_ar/norm(del_ar); %?
del_rs =resample(del_ir,fs_48,fs_24);



y = [zeros(1,1.5*fs_48) del_rs zeros(1,0.5*fs_48-length(del_rs)) x_rs_f zeros(1,fs_48)]; 

sig_1 = zeros(length(y),6); 

sig_1(:,idx)= y'; 

audiowrite(file_comp1,5*sig_1,fs_48,'BitsPerSample',16) ;


save(mat_file,'a_ar');

% how to average 3 readings
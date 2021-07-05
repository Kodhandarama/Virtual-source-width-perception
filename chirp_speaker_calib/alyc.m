clear variables
% close all 
clc

file_in = './data/chirp_1_7_12k.wav'; 
file1 = './data_rec/rec_lr_ls1.wav'; 

L = 200
[res1,R1] = fn_ir(file1,1,L);
[res2,R2] = fn_ir(file1,2,L);


fs = 48000; 

%[tg1_ap,tg1_mp,z1_ap,z1_mp,z1] =fn_allpass_decomp_v1(h1,p,fs);
%[tg2_ap,tg2_mp,z2_ap,z2_mp,z2] =fn_allpass_decomp_v1(h2,p,fs);

%tg1 = real( fft(h1(1:p).*[0:p-1]',fs) ./ fft(h1(1:p),fs));
% tg2 = real( fft(h2(1:p).*[0:p-1]',fs) ./ fft(h2(1:p),fs));

subplot(2,1,1)
plot(res1)
% ylim([-.2 0.3])
subplot(2,1,2)
plot(res2)
% ylim([-.2 0.3])

figure
plot(20*log10(abs(R1))) 
hold on
plot(20*log10(abs(R2)),'r') 
% 
% 




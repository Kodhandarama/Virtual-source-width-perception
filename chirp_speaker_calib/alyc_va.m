% 
% clear variables
% close all
% clc


% addpath '/home/arthi/matlab/Functions/spectral analysis/ch3'
% addpath '/home/arthi/matlab/asw/spatialize_model/v8_reverb/'

file_ir = 'chirp_recording/ls1_chirp_recording_2_channels.wav'; 
file_comp = 'compensated_chirp_recording/ls1_mic2_compensated_recording.wav'; 

L=2000; 
[h1,H1] = fn_ir(file_ir,1,L);
[h2,H2] = fn_ir(file_comp,1,L);
[h3,H3] = fn_ir(file_ir,2,L);
% subplot(1,2,1)
% plot(-h1/max(abs(h1))) 
% plot(h1) 
% ylim([-1 1])
% subplot(1,2,2)
% plot(h2/max(abs(h2)))

% plot(h2)

% ylim([-1 1])
% subplot(1,3,3)
% %plot(h3_/max(h3_)) 
% plot(h3_) 
% ylim([-1 1])
% close all 
% plot(20*log10(abs(H1)),'b') 
% hold on 
plot(20*log10(abs(H2)),'r')
% hold on 
% plot(20*log10(abs(H3)),'m')

xlim([0 24000])




a =  1;
% s1 = filter(h1,1,ones(1,1000));
% s2 = filter(h2,1,ones(1,1000));
% plot(s1)
% hold on 
% plot(s2,'r')
% 
% tg1 = real( fft(h1(1:200).*[0:200-1]',fs) ./ fft(h1(1:200),fs));
% tg2 = real( fft(h2(1:200).*[0:200-1]',fs) ./ fft(h2(1:200),fs));

%[tg1_ap,tg1_mp,z1_ap,z1_mp,z1] =fn_allpass_decomp_v1(h1_,200,fs);

%[tg2_ap,tg2_mp,z2_ap,z2_mp,z2] =fn_allpass_decomp_v1(h2_,200,fs);


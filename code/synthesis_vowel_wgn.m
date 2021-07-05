%%%%%%%%%%%%%%%%
% Experiment 2 
%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%
%Functions used
%variable_data_exp2(), getpitch1, genH2_ImpResp, ramp_fix

% Problems: bw discontinuity

% clear variables;
% clc;

%addpath '/home/arthi/matlab/Functions/spectrogram/' '/home/arthi/matlab/Functions/Auditory toolbox/'; 
function SNR_level = synthesis_vowel_wgn(filename,required_snr,vowel,modsigma)
% load('A_filters.mat')
% load('U_filters.mat')
% load('I_filters.mat')
% load('A_filters_v2.mat')
load('lowpass8000.mat');
if vowel =='u'
    formantfrequencies =[276.653
729.39
1874.153
2810.542
3852.895
4110.756
5354.253
6180.132
6897.899
8000];
%     disp(formantfrequencies)
    formantbandwidths = [47.92*modsigma
76.90111111*modsigma
500.6022222*modsigma
568.3688889*modsigma
251.0244444*modsigma
516.2144444*modsigma
645.5211111*modsigma
594.1455556*modsigma
375.0477778*modsigma
426.3288889*modsigma];
%     disp(formantbandwidths)
elseif vowel =='a'
formantfrequencies =[73.914
780.165
1196.058
2661.916
3323.918
3864.073
4630.714
5291.067
6505.292
6956.786];
% disp(formantfrequencies)
formantbandwidths = [826.616*modsigma
123.92*modsigma
186.428*modsigma
204.724*modsigma
208.746*modsigma
330.352*modsigma
143.37*modsigma
167.864*modsigma
718.678*modsigma
271.586*modsigma];
% disp(formantbandwidths)
elseif vowel =='i'
    formantfrequencies = [287.364
2281.456
2930.192
3170.431
3919.456
4470.975
5809.803
6688.874
7781.95
8000];
%     disp(formantfrequencies)
    formantbandwidths = [23.71*modsigma
465.066*modsigma
175.5028571*modsigma
1188.714*modsigma
121.048*modsigma
63.454*modsigma
163.355*modsigma
194.991*modsigma
688.355*modsigma
2615.316*modsigma]
%     disp(formantbandwidths)
else 
    disp("Invalid vowel")
end
variable_data_exp2();
load('var_data_exp2.mat'); 
if(required_snr == 0)
   required_snr=required_snr+0.001; 
end
t = [0:(T*fs)-1]/fs;

cnt1 = 1;

% %formant frequency and bandwidth
bandw = formantbandwidths;
formantss = formantfrequencies;
alpha1 = 1; alpha2 = 1; 
i = 1; 
[e,pitch] = getpitch1(t,p1(i),p2(i),p3(i),fs,ptype);
e = e/norm(e) * 60;
noise1 = wgn(length(e),1,(10*log10((rms(e)^2)/(10^(required_snr/10)))))';

excitation = e + noise1;
check_snr = snr(e,noise1);  
% excitation = excitation/norm(excitation) * 60;

[a,x1,f1_freq,sigma_freq] = genH1_vowel(fs,formantss,bandw,excitation,vowel) ;
x1_rs = resample(x1,48000,fs); 
fs = 48000; 
x = x1_rs;  
reconst_new = ramp_fix(x,fs,t_length_rise_fall); %62.5 ms
[b_coeff,a_coeff] = butter(10,8000/(fs/2)); %butter(20,10000/(fs/2));
r_filt = filter(b_coeff,a_coeff,reconst_new);
reconst1 = r_filt/norm(r_filt) * 60;

[pxx,f] = pwelch(reconst1,48000,46000,48000,fs,'power');
pxval= 0-10*log10(pxx);
% subplot(1,2,1)
% plot(f,10*log10(pxx));

SNR_level = fit_lp(reconst1,fs,vowel,modsigma);
disp(SNR_level);


single_channel_file=strcat('single_channel_',filename);
% audiowrite(single_channel_file,reconst1,fs,'Bitspersample',16);
% audiowrite('single_channel_stimuli.wav',reconst1,fs,'Bitspersample',16);
%cnt1 = cnt1+1;
% %
% player = audioplayer(reconst1,fs);
% play(player);

% generated_decorrelated_signals(filename);
% str = ['killall python3'];
% unix(str)
% str2 = ['python3 play_8chn.py ' filename ' &'];
% unix(str2)
%   7.8125e-04 
temporaryvar=5;
end
%%%%%%%%%%%%%%%%
% Experiment 2 
%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%
%Functions used
%variable_data_exp2(), getpitch1, genH2_ImpResp, ramp_fix

% Problems: bw discontinuity
function synthesis_vowel_OB1000(filename,required_snr)

% clear variables;
% clc;

%addpath '/home/arthi/matlab/Functions/spectrogram/' '/home/arthi/matlab/Functions/Auditory toolbox/'; 

variable_data_exp2();

load('var_data_exp2.mat'); 
load('octavebandfilter1000.mat');

t = [0:(T*fs)-1]/fs;
%t=awgn(t4,50);
cnt1 = 1;

% %formant frequency and bandwidth
change1= 0; change2 = 0; 
f_from = form_freq(alpha1,:)*(1+change1);
f_to = form_freq(alpha2,:)*(1+change2);
[bw_from,bw_to] = bw_adjust(alpha1,alpha2,change1,change2,form_freq);

alpha1 = 1; alpha2 = 1; 
i = 1; 
[e,pitch] = getpitch1(t,p1(i),p2(i),p3(i),fs,ptype);
% e4=awgn(e,10,'measured');

%required_snr =10;
noise1 = wgn(length(e),1,(10*log10((rms(e)^2)/(10^(required_snr/10)))))';
OBnoise1000  = filter(octavebandfilter1000,noise1);
snrr = snr(e,OBnoise1000);

gamma = (snrr/required_snr);
alpha = ((rms(e)^2)/(rms(OBnoise1000)^2))^((gamma -1)/gamma);
scaling_factor = sqrt(alpha);

e4 = e + (OBnoise1000 * scaling_factor);

%plot(t,e4)

%x2=awgn(x1,50);
% plot(t,e4)
[a,x1,f1_freq,sigma_freq] = genH1_vowel(fs,f_from,bw_from,e4);
x1_rs = resample(x1,48000,fs); 
fs = 48000; 
%env = sin(2*pi*2*t); 
%env = gampdf(t(1:fs+fs/2),3,1/10);
%delay = 20e-3*fs + (100e-3*fs)*rand(1,10);delay = round(delay);
%env_seq = [env zeros(1,delay(1)) env zeros(1,delay(2)) env zeros(1,delay(3)) env zeros(1,delay(4)) ...
%    env zeros(1,delay(5)) env zeros(1,delay(6)) env zeros(1,delay(7)) env zeros(1,delay(8)) env zeros(1,delay(9)) env zeros(1,delay(10))]; 
%env_seq = [env env env env env env env env env env]; 
x = x1_rs; %(1:length(env_seq)).*env_seq; 
%filename = '/home/kodhandarama/Desktop/Desktop/Analog/Shreeram Chandra/shreeram/python_work/python_sounddevice/vowels_in_channels/synthetic_vowel_A_fundamentalfreq240.wav';
reconst_new = ramp_fix(x,fs,t_length_rise_fall); %62.5 ms
[b_coeff,a_coeff] = butter(10,4000/(fs/2)); %butter(20,10000/(fs/2)); 
r_filt = filter(b_coeff,a_coeff,reconst_new);
reconst1 = r_filt/norm(r_filt) * 15;

reconst2=awgn(reconst1,10,'measured');
% sigpower = mean(reconst1.^2);
% noiselevel = awgn(10,1,10);
% noisepower = mean(noiselevel.^2);
% 
% required_snr =10;
% noise1 = wgn(length(reconst1),1,10*log10((rms(reconst1)^2)/(required_snr)))';
% snrr = snr(reconst1,noise1);
% noisy_signal = reconst1 + noise1;
% plot(t,noisy_signal)

audiowrite(filename,4*reconst1,fs,'Bitspersample',16);
%cnt1 = cnt1+1;
end
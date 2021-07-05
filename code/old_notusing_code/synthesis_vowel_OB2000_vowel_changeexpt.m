%%%%%%%%%%%%%%%%
% Experiment 2 
%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%
%Functions used
%variable_data_exp2(), getpitch1, genH2_ImpResp, ramp_fix

% Problems: bw discontinuity
function synthesis_vowel_OB2000_vowelchange(filename,required_snr,alpha_val)

% clear variables;
% clc;

%addpath '/home/arthi/matlab/Functions/spectrogram/' '/home/arthi/matlab/Functions/Auditory toolbox/'; 

variable_data_exp2(alpha_val);

load('var_data_exp2_vc.mat'); 
load('octavebandfilter2000.mat');

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
OBnoise2000  = filter(Octavebandfilter2000,noise1);
snrr = snr(e,OBnoise2000);
e4 = e + OBnoise2000;
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



function variable_data_exp2(alpha_val)

T = 6;            % Time duration
duration = T;     % Time duration
fs = 48000;         % Sampling frequency

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Formant frequency details from Rabiner and Juang
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

form_freq = [
            270 2290 3010 3781 4200;    % 1  /i/
            390 1990 2550 3781 4200 ;   % 2  /I/
            530 1840 2480 0 0;          % 3
            660 1720 2410 0 0 ;         % 4
            520 1190 2390 0 0 ;         % 5
            730 1090 2440 3781 4200;    % 6  /a/
            570 840 2410 3406 4200;     % 7
            440 1020 2240 3406 4200;    % 8
            300 870 2240 3406 4200;     % 9  /u/ 
            490 1350 1690 0 0];         % 10

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Band-width details from Rabiner and Juang and Cheveign 1999
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bw = [38 66 171 309.34 368;             % 1  /i/
      42 71 142 309.34 368;             % 2  /I/ 
      0 0 0 0 0 ;                       % 3  
      0 0 0 0 0 ;                       % 4  
      0 0 0 0 0;                        % 5  
      60 50 102 309.34 368;             % 6  /a/
      47 50 98 256.84 368;              % 7  
      51 61 90 256.84 368 ;             % 8  
      50 58 107 256.84 368;             % 9  /u/
      0 0 0 0 0];                       % 10  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Pitch glide type
%   l - linear 
%   p - to generate V shaped and inv-V shaped pitch glides
%   p1, p2 specify starting and ending pitch for linear pitch glide
%   p1, p3 - specify starting and ending pitch for parabolic pitch glide and
%   p2 specifies intermediate pitch (depth or height) 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bw;
ptype = 'p'; % 'l' 'p'  

p1 = 140; %100 * 2.^([0:1:12]/12);
p2 = 140; %100 * 2.^([-3:1:12-3]/12);
p3 = p1; 

% fmax = maximum frequency range required for calculating distance measure
fmax = 10000; 

% alpha1 = corresponds to choosing the starting vowel 1- /i/, 6 - /a/, 9 -/u/
alpha1 = alpha_val; 

% alpha2 = corresponds to choosing the ending vowel 1- /i/, 6 - /a/, 9 -/u/
alpha2 = alpha_val;

% t_length_rise_fall = correspondings to number of samples for rise and fall time
t_length_rise_fall = (fs)/16; 
save 'var_data_exp2_vc.mat'
end
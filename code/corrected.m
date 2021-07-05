

folderdir ='/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/expt_4_stimuli/single_channel_stimuli/';
path2 = '/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/expt_4_stimuli/W6/';
files = dir(fullfile(folderdir));
W='6';

for i = 3:length(files)
filename = files(i).name
  
        
load('coeffs/ls1_comp.mat');
load('coeffs/ls2_comp.mat');
load('coeffs/ls3_comp.mat');
load('coeffs/ls4_comp.mat');
load('coeffs/ls5_comp.mat');
load('coeffs/ls6_comp.mat');

fs_48 = 48000;
fs_24 = 24000;
N = 600000; % sample size
Fs= 48000;
t = (1:N)*(1/Fs);
[vowel_sound,Fs] = audioread(strcat(folderdir,filename));
r = 720;
sound_array_1 = [zeros(1,r) ,vowel_sound' , zeros(1, 600000 -length(vowel_sound) - r)];
r2 = 1104;
sound_array_2 = [zeros(1,r2) ,vowel_sound' , zeros(1, 600000 -length(vowel_sound) - r2)];

r3 = 3552;
sound_array_3 = [zeros(1,r3) ,vowel_sound' , zeros(1, 600000 -length(vowel_sound) - r3)];

r4 = 2832;
sound_array_4 = [zeros(1,r4) ,vowel_sound' , zeros(1, 600000 -length(vowel_sound) - r4)];

r5 = 1824;
sound_array_5 = [zeros(1,r5) ,vowel_sound' , zeros(1, 600000 -length(vowel_sound) - r5)];

r6 = 3648;
sound_array_6 = [zeros(1,r6) ,vowel_sound' , zeros(1, 600000 -length(vowel_sound) - r6)];

N_channel_array = zeros(600000,6);
N_channel_array(:,1) = sound_array_1;
N_channel_array(:,2) = sound_array_2;
N_channel_array(:,3) = sound_array_3;
N_channel_array(:,4) = sound_array_4;
N_channel_array(:,5) = sound_array_5;
N_channel_array(:,6) = sound_array_6;


N_channel_array = zeros(600000,6);
if(W=='1')
% N_channel_array(:,1) = sound_array_2./(2*sqrt(2));
% N_channel_array(:,2) = sound_array_2./2;
N_channel_array(:,3) = sound_array_3;
% N_channel_array(:,4) = sound_array_4./2;
% N_channel_array(:,5) = sound_array_5./2;
% N_channel_array(:,6) = sound_array_2./(2*sqrt(2));
elseif(W=='2')
% N_channel_array(:,1) = sound_array_2./(2*sqrt(2));
% N_channel_array(:,2) = sound_array_2./2;
N_channel_array(:,3) = sound_array_3./sqrt(2);
N_channel_array(:,4) = sound_array_4./sqrt(2);
% N_channel_array(:,5) = sound_array_5./2;
% N_channel_array(:,6) = sound_array_2./(2*sqrt(2));
elseif(W=='4')
% N_channel_array(:,1) = sound_array_2./(2*sqrt(2));
N_channel_array(:,2) = sound_array_2./2;
N_channel_array(:,3) = sound_array_3./2;
N_channel_array(:,4) = sound_array_4./2;
N_channel_array(:,5) = sound_array_5./2;
% N_channel_array(:,6) = sound_array_2./(2*sqrt(2));
elseif(W=='6')
N_channel_array(:,1) = sound_array_2./(2*sqrt(2));
N_channel_array(:,2) = sound_array_2./(2*sqrt(2));
N_channel_array(:,3) = sound_array_3./(2*sqrt(2));
N_channel_array(:,4) = sound_array_4./(2*sqrt(2));
N_channel_array(:,5) = sound_array_5./(2*sqrt(2));
N_channel_array(:,6) = sound_array_2./(2*sqrt(2));

else
    disp("IGNORE")
end







if(W=='1')
x= N_channel_array(:,3);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar3,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,3) = x_rs_f;
elseif(W=='2')
x= N_channel_array(:,3);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar3,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,3) = x_rs_f;


x= N_channel_array(:,4);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar4,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,4) = x_rs_f;
elseif(W=='4')
x= N_channel_array(:,2);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar2,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,2) = x_rs_f;


x= N_channel_array(:,3);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar3,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,3) = x_rs_f;


x= N_channel_array(:,4);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar4,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,4) = x_rs_f;

% 
x= N_channel_array(:,5);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar5,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,5) = x_rs_f;

elseif(W=='6')
x= N_channel_array(:,1);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar1,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,1) = x_rs_f;
% % 
x= N_channel_array(:,2);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar2,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,2) = x_rs_f;


x= N_channel_array(:,3);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar3,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,3) = x_rs_f;


x= N_channel_array(:,4);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar4,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,4) = x_rs_f;

% 
x= N_channel_array(:,5);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar5,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,5) = x_rs_f;

% 
x= N_channel_array(:,6);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar6,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,6) = x_rs_f;
else
    disp("IGNORE")
end




fs = 48000;
t_length_rise_fall=(fs)/8;
tb = [0:t_length_rise_fall-1]/fs;
x = -5:10/length(tb):5-10/length(tb);
sigmoid_a = (1-tanh(x)) /2;
sigmoid_b = (1+tanh(x)) /2;
fd = sigmoid_a';
% [soundchannels,Fs] = audioread(filename);
soundchannels = N_channel_array;


fix_channel1 = soundchannels(:,1);
fix_channel_slice1 = fix_channel1(1:158400);
fix_channel_slice1_ramp = fix_channel_slice1;
fix_channel_slice1_ramp(end-length(tb)+1:end) = fix_channel_slice1(end-length(tb)+1:end).* fd;

fix_channel2 = soundchannels(:,2);
fix_channel_slice2 = fix_channel2(1:158400);
fix_channel_slice2_ramp = fix_channel_slice2;
fix_channel_slice2_ramp(end-length(tb)+1:end) = fix_channel_slice2(end-length(tb)+1:end).* fd;

fix_channel3 = soundchannels(:,3);
fix_channel_slice3 = fix_channel3(1:158400);
fix_channel_slice3_ramp = fix_channel_slice3;
fix_channel_slice3_ramp(end-length(tb)+1:end) = fix_channel_slice3(end-length(tb)+1:end).* fd;

fix_channel4 = soundchannels(:,4);
fix_channel_slice4 = fix_channel4(1:158400);
fix_channel_slice4_ramp = fix_channel_slice4;
fix_channel_slice4_ramp(end-length(tb)+1:end) = fix_channel_slice4(end-length(tb)+1:end).* fd;

fix_channel5 = soundchannels(:,5);
fix_channel_slice5 = fix_channel5(1:158400);
fix_channel_slice5_ramp = fix_channel_slice5;
fix_channel_slice5_ramp(end-length(tb)+1:end) = fix_channel_slice5(end-length(tb)+1:end).* fd;

fix_channel6 = soundchannels(:,6);
fix_channel_slice6 = fix_channel6(1:158400);
fix_channel_slice6_ramp = fix_channel_slice6;
fix_channel_slice6_ramp(end-length(tb)+1:end) = fix_channel_slice6(end-length(tb)+1:end).* fd;

r = 48000 * 2;
r2= 48000 * 5;
delay = zeros(1,r);
delay2 = zeros(1,r2);
N_channel_1 = [delay, fix_channel_slice1_ramp',delay2];
N_channel_2 = [delay, fix_channel_slice2_ramp',delay2];
N_channel_3 = [delay, fix_channel_slice3_ramp',delay2];
N_channel_4 = [delay, fix_channel_slice4_ramp',delay2];
N_channel_5 = [delay, fix_channel_slice5_ramp',delay2];
N_channel_6 = [delay, fix_channel_slice6_ramp',delay2];
N_channel_array = zeros(494400,6);

N_channel_array(:,1) = N_channel_1';
N_channel_array(:,2) = N_channel_2';
N_channel_array(:,3) = N_channel_3';
N_channel_array(:,4) = N_channel_4';
N_channel_array(:,5) = N_channel_5';
N_channel_array(:,6) = N_channel_6';

% player = audioplayer(N_channel_3,fs);
% play(player);
real =5 ;
writepath =strcat(path2,filename(16:end));
audiowrite(writepath,N_channel_array,48000);

end
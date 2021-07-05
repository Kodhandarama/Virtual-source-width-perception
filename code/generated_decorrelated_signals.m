function generated_decorrelated_signals(filename)

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
% tone = 10 * sin(2*pi*2000*t) ;
% 1 second =  48000 samples
% 30 ms = 1440 samples
% saw = t;
% noisee =  awgn(saw,10,'measured');;

% L=N; %Sample length for the random signal
% mu=0;
% sigma=2;
% noisee=sigma*randn(L,1)+mu;
[vowel_sound,Fs] = audioread('d_ai_pitch_150_200.wav');
r = 615;
sound_array_1 = [zeros(1,r) ,vowel_sound' , zeros(1, 600000 -length(vowel_sound) - r)];
r2 = 547;
sound_array_2 = [zeros(1,r2) ,vowel_sound' , zeros(1, 600000 -length(vowel_sound) - r2)];

r3 = 40;
sound_array_3 = [zeros(1,r3) ,vowel_sound' , zeros(1, 600000 -length(vowel_sound) - r3)];

r4 = 946;
sound_array_4 = [zeros(1,r4) ,vowel_sound' , zeros(1, 600000 -length(vowel_sound) - r4)];

r5 = 335;
sound_array_5 = [zeros(1,r5) ,vowel_sound' , zeros(1, 600000 -length(vowel_sound) - r5)];

r6 = 58;
sound_array_6 = [zeros(1,r6) ,vowel_sound' , zeros(1, 600000 -length(vowel_sound) - r6)];

N_channel_array = zeros(600000,6);
N_channel_array(:,1) = sound_array_1;
N_channel_array(:,2) = sound_array_2;
N_channel_array(:,3) = sound_array_3;
N_channel_array(:,4) = sound_array_4;
N_channel_array(:,5) = sound_array_5;
N_channel_array(:,6) = sound_array_6;

% pure_6_channels_name = strcat("6_channels_",filename);
% audiowrite(pure_6_channels_name,N_channel_array,48000)

N_channel_array = zeros(600000,6);
% N_channel_array(:,1) = sound_array_2./(2*sqrt(2));
% N_channel_array(:,2) = sound_array_2./(sqrt(2));
N_channel_array(:,3) = sound_array_3;
% N_channel_array(:,4) = sound_array_4./(sqrt(2));
% N_channel_array(:,5) = sound_array_5./(sqrt(2));
% N_channel_array(:,6) = sound_array_2./(2*sqrt(2));

% % 
% x= N_channel_array(:,1);
% x =resample(x,fs_24,fs_48);
% x_ar = filter(a_ar1,1,x); 
% x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
% x_rs =resample(x_n,fs_48,fs_24);
% b= fir1(100,12000/(fs_48/2));%12k lowpass
% x_rs_f = filter(b,1,x_rs); 
% N_channel_array(:,1) = x_rs_f;
% % 
% x= N_channel_array(:,2);
% x =resample(x,fs_24,fs_48);
% x_ar = filter(a_ar2,1,x); 
% x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
% x_rs =resample(x_n,fs_48,fs_24);
% b= fir1(100,12000/(fs_48/2));%12k lowpass
% x_rs_f = filter(b,1,x_rs); 
% N_channel_array(:,2) = x_rs_f;
% 

x= N_channel_array(:,3);
x =resample(x,fs_24,fs_48);
x_ar = filter(a_ar3,1,x); 
x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
x_rs =resample(x_n,fs_48,fs_24);
b= fir1(100,12000/(fs_48/2));%12k lowpass
x_rs_f = filter(b,1,x_rs); 
N_channel_array(:,3) = x_rs_f;


% x= N_channel_array(:,4);
% x =resample(x,fs_24,fs_48);
% x_ar = filter(a_ar4,1,x); 
% x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
% x_rs =resample(x_n,fs_48,fs_24);
% b= fir1(100,12000/(fs_48/2));%12k lowpass
% x_rs_f = filter(b,1,x_rs); 
% N_channel_array(:,4) = x_rs_f;

% % 
% x= N_channel_array(:,5);
% x =resample(x,fs_24,fs_48);
% x_ar = filter(a_ar5,1,x); 
% x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
% x_rs =resample(x_n,fs_48,fs_24);
% b= fir1(100,12000/(fs_48/2));%12k lowpass
% x_rs_f = filter(b,1,x_rs); 
% N_channel_array(:,5) = x_rs_f;

% % 
% x= N_channel_array(:,6);
% x =resample(x,fs_24,fs_48);
% x_ar = filter(a_ar6,1,x); 
% x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
% x_rs =resample(x_n,fs_48,fs_24);
% b= fir1(100,12000/(fs_48/2));%12k lowpass
% x_rs_f = filter(b,1,x_rs); 
% N_channel_array(:,6) = x_rs_f;

% 



% str = ['killall python3'];
% unix(str)
% str2 = ['python3 play_8chn.py ' filename ' &'];
% unix(str2)
% player = audioplayer(vowel_sound,fs_48);
% play(player);


audiowrite(filename,N_channel_array,48000);
end

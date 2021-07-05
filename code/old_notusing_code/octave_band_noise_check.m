[signal,Fs] = audioread("/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/vowels_in_channels/vowel_u.wav");
load('octavebandfilter500.mat');
fs= 48000;

% noise =wgn(len,1,10);

% noise =  zeros(10000,1);
% for i = 1:10000
%         noise(i) =noise(i) + 5;
% end
% noise
required_snr = 10;
noise = wgn(length(signal),1,(10*log10((rms(signal)^2)/(10^(required_snr/10)))))';
pwelch(noise,[],[],[],fs)
hold on
OBnoise500  = filter(octaveband500,noise);
snrr = snr(signal',OBnoise500);
gamma = (snrr/required_snr);
alpha = ((rms(signal)^2)/(rms(OBnoise500)^2))^((gamma -1)/gamma);
scaling_factor = sqrt(alpha);
yn =fft(signal);
n = length(signal);     % number of samples
f = (0:n-1)*(fs/n);     % frequency range
power = abs(yn).^2/n;    % power of the DFT
% 
plot(f/1000,10*log10(power),'r')
xlabel('Frequency')
ylabel('Power')

hold on

% plot(OBnoise500)
pwelch(OBnoise500 * scaling_factor,[],[],[],fs)
snr(signal,OBnoise500' * scaling_factor)
% n = length(filterednoise);          % number of samples
% f = (0:n-1)*(fs/n);     % frequency range
% power = abs(yfn).^2/n;    % power of the DFT
% 
% plot(f,power)
% xlabel('Frequency')
% ylabel('Power')
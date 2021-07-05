clc;
clear all;
% load("lowpass4000.mat");
load("lowpass8000.mat");
% load("lowpass8000_2.mat");
%%%%%%%%%%%%%%%%%%Loading vowel %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[vowela,fs] =  audioread("/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/wav_files_before_final/natural_vowel_u.wav");
segmentlen = 100;
noverlap = 90;
NFFT = 128;
 
% spectrogram(vowela,segmentlen,noverlap,NFFT,fs,'yaxis')
% title('Signal Spectrogram')
% plot(vowela)
%%%%%%%%%%%%%%%%Extracting%%%%%%%%%%%%%%30ms%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dt = 1/fs;
I0 = round(3.18/dt);
Iend = round(3.21/dt);
x = vowela(I0:Iend);
% plot_fft(x,fs);
% % hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%lowpass filter and resample%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
x1 = filter(lowpass8000,x);%order200 equiripple FIR filter
% plot_fft(x1,fs);
x1 = x1.*hamming(length(x1));
%  plot_fft(x1,fs);
 
fs2=16000;
x2 =  resample(x1,1,3);
% plot_fft(x2,fs2)
% hold on

%% 
% %%%%%%%%%%%%%%%%%%Create transferfunction%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % spectrogram(x2,segmentlen,noverlap,NFFT,fs,'yaxis');
[A,G] = lpc(x2,20);
rts = roots(A);
%% 
% val1=[]; gg=zeros([1 8000]); for p = 1:length(A)
%     sum=zeros([1 8000]); for r= 0:7999
%       temp=A(p)*exp(-1i*2*pi*(p-1)*f(r)); sum=sum+temp;
%      end
%     gg=gg+sum;
%      if(imag(A(p)*exp(-1i*2*pi*f*(p-1)))>=0);
%     temp=A(p)*exp(-1i*2*pi*f*(p-1));
%      temp2=[]; for d =1:length(temp)
%          if(imag(temp(d))>=0)
%              temp2(end+1) =temp(d);
%          end
%      end val1(end+1,:) = temp2; end
% end val2 = gg.^2; val3 = 1./val2;
%  
%% 
hold on

[homega,w]=freqz(sqrt(G*length(x2)),A,fs2/2);
f=1:16000;
res=fft(x2,16000);
f = w*fs2/2/pi;
plot(f,20*log10(abs(homega)),'r')
plot(f,20*log10(abs(res(1:fs2/2))),'k' )





nnn= 1:481;
% plot(nnn,exc);
synthesis_signaltime = filter(sqrt(G)*length(x2),A,x2);
synthesis_signalfq = fft(synthesis_signaltime,241);
hold off
% plot(nnn,synthesis_signaltime)
% plot(nnn,synthesis_signaltime)


synn = filter(A,1,synthesis_signaltime);
timesynn = ifft(synn);
% player = audioplayer(10*timesynn,fs);
% play(player);
rts = rts(imag(rts)>=0);
angz = atan2(imag(rts),real(rts));

[formantfrequencies,indices] = sort(angz.*(fs2/(2*pi)));
formantbandwidths = -1*(fs2/(pi))*log(abs(rts(indices)));

nn = 1;
formants=[];
bws=[];
for kk = 1:length(formantfrequencies)
    if (formantfrequencies(kk)<5500  & formantbandwidths(kk)<400)
        formants(end+1) = formantfrequencies(kk);
%         bws(end+1) = bw(kk);
        disp("Formant_freq")
        disp(formantfrequencies(kk));
        disp("bw");disp(formantbandwidths(kk))
%         nn = nn+1;
    end
end
fprintf('%.2f\n',formantfrequencies)
disp("__________________")
% fprintf('%.2f\n',bws)

fprintf('%.2f\n',formantbandwidths)



vad = reconst1';
fs= 48000;
dt = 1/fs;
I0 = round(3.18/dt);
Iend = round(3.21/dt);
x1 = vad(I0:Iend);

% fs2=16000;
% x2 =  resample(x1,1,3);
% % res=fft(x2,16000);
% % f=1:16000;
% % plot(20*log10(abs(res(1:fs2/2))),'k' )
% [A,G] = lpc(x2,20);
% [homega,w]=freqz(sqrt(G*length(x2)),A,fs2/2);
% f=1:16000;
% res=fft(x2,16000);
% f = w*fs2/2/pi;
% plot(f,20*log10(abs(homega)),'r')
% hold on;
% plot(f,20*log10(abs(res(1:fs2/2))),'k' )

x1 = filter(lowpass8000,x1);
x1 = x1.*hamming(length(x1));

 
fs2=16000;
x2 =  resample(x1,1,3);
[A,G] = lpc(x2,20);
 
hold on

[homega,w]=freqz(sqrt(G*length(x2)),A,fs2/2);
f=1:16000;
res=fft(x2,16000);
f = w*fs2/2/pi;
plot(f,20*log10(abs(homega)),'r')
hold on;
plot(f,20*log10(abs(res(1:fs2/2))),'k' )

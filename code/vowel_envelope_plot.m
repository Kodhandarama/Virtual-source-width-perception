hold on;
[A,G] = lpc(reconst1,20);
rts = roots(A);
[homega,w]=freqz(sqrt(G*length(reconst1)),A,fs/2);
% f=1:48000;
res=fft(reconst1,48000);
f = w*fs/2/pi;
plot(f,20*log10(abs(homega))-70,'r')
% plot(f,20*log10(abs(res(1:fs/2))),'k' )

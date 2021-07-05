function SNR_level= fit_lp(signal,fs,vowel,modsigma)
load('lowpass8000.mat');
polynomial_nonoise = synthesis_vowel_nonoise2('temp_poly.wav',vowel,modsigma);
[pxx,f] = pwelch(signal,48000,46000,48000,fs,'power');
% pxx=pxx/norm(pxx)* 153.8462;
pxval= 0-10*log10(pxx);
plot(f,10*log10(pxx));
% plot(f,pxval);
hold on;
pxx_modrange = pxx(200:5500);
pxx_modrange_pdf= pxx_modrange/sum(pxx_modrange);
% pxxpdf = pxx/sum(pxx);
[Peak2, PeakIdx2] = findpeaks(pxval);
% stem(PeakIdx2,Peak2)
polynomial_noisy = polyfit(PeakIdx2,Peak2,71);
ypolynoisy = polyval(polynomial_noisy,f);
plot(f,-ypolynoisy)
hold on;
ypolynonoise = polyval(polynomial_nonoise,f);
plot(f,-ypolynonoise)

SNR_level=0;for n = 1000:5500
SNR_level = SNR_level + pxx_modrange_pdf(n-999)*(ypolynoisy(n) - ypolynonoise(n));
end
% disp(SNR_level)
% hold on;

% dt = 1/fs;
% I0 = round(3/dt);
% Iend = round(3.03/dt);
% x = signal(I0:Iend)';
x=signal';
freww = fft(signal,fs);
% hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%lowpass filter and resample%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
x1 = filter(lowpass8000,x);%order200 equiripple FIR filter
x1 = x1.*hamming(length(x1));
% plot_fft(x1,fs);
 
fs_16=16000;
x2 =  resample(x1,1,3);
% plot_fft(x2,fs2)
[A,G] = lpc(x2,20);

[homega,w]=freqz(sqrt(G*length(x2)),A,fs_16/2);
res=fft(x2,16000);
f = w*fs_16/2/pi;
% plot(f,20*log10(abs(homega)))
z=20*log10(abs(homega));
[Peak, PeakIdx] = findpeaks(z);
% stem(PeakIdx,Peak);
% plot(f,20*log10(abs(res(1:fs_16/2))) )
%  axis([0 6000 -100 150]);
% [hplot(20*log10(abs(xx(1:fs/2))) )
% plot(f,10*log10(pxx));omega,w]=freqz(length(x2).*sqrt(G),A,fs_16/2);
% % f=1:16000;
% f = w*fs_16/2/pi;
% plot(f,20*log10(abs(homega)),'b');
% hold on;
% f2=1:48000;
% plot(f2,20*log10(abs(freww)),'r');
% % plot(f,20*log10(abs(signal(1:fs_16/2))),'k' )

% disp('hehe');
end
function plot_fft(signal,fs)

yn =fft(signal,fs);
n = length(signal);     % number of samples
% f = (0:n-1)*(fs/n); 
% frequency range
f=1:fs;
% power = abs(yn).^2/n;    % power of the DFT
% plot(f,10*log10(power))

plot(20*log10(abs(fft(signal))),'k')
xlabel('Frequency')
ylabel('Power')


end
function plot_fft(signal,fs)

yn =fft(signal,fs);
n = length(signal);     % number of samples
% f = (0:n-1)*(fs/n); 
% frequency range
f=1:fs;
power = abs(yn);    % power of the DFT
plot(f,20*log10(power))
xlabel('Frequency')
ylabel('Power')


end
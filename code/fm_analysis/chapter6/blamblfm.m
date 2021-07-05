% Objective: To obtain an AM-FM signal with bandlimited AM and bandlimited FM

% Author: Jitendra Kumar Gupta and S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================


% AMFM generation
N=512;
L=512;'
fc=0.2;
wl=128;
n=0:N-1;

% bandlimited AM generation
hAM=fir1(L,0.04);
wnoise=randn(1,N);
AM=conv(wnoise,hAM);
AM=AM(L/2+1:end-L/2);
AM=AM-min(AM)+0.4;
win=hamming(wl);
AM(1:wl/2)=AM(1:wl/2).*win(1:wl/2)';
AM(end-wl/2+1:end)=AM(end-wl/2+1:end).*win(wl/2+1:end)';

% bandlimited FM generation
hFM=fir1(L,0.05);
wnoise=randn(1,N);
FM=conv(wnoise,hFM);
FM=FM(L/2+1:end-L/2);
FM=FM-min(FM)+0.03;
FM=0.1*FM/max(abs(FM));FM=fc+FM;

% phase modulation generation
PM=cumsum(FM);
amfm=AM.*sin(2*pi*PM);

plot(amfm);
xlabel('time');
ylabel('amplitude')


% Done


% Objective: Generate a noisy AM-FM signal (bandpass signal)

% Author: JK Gupta and S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% SNR: signal-to-noise ratio
% AMFM: AM-FM signal (bandpass)
% w_cent: center frequency (of the bandpass signal)

% Output: 
% AMFMnois = noisy AM-FM signal

% =======================================================================================


function [AMFMnoise]=noise(SNR,AMFM,w_cent);

L_AMFM=length(AMFM);
n=0:L_AMFM-1;
w_interval=2*pi/(L_AMFM*2-1);	% 'w_interval': frequency domain spacing
ww=0:w_interval:2*pi;

% Spectrum of AM-FM
for ii=1:L_AMFM*2
   FT_AMFM(ii)=sum(AMFM.*exp(-j*ww(ii)*n));
end
total_e=cumsum(abs(FT_AMFM(1:L_AMFM)).^2);	% Energy of AMFM
total_e=max(total_e);

mid=L_AMFM*2*w_cent+1-0.64;  	% Mapping of central frequency

e=0;ii=0;

% e is 95% energy of AMFM
while e<0.95*total_e,
   ii=ii+1;
   if ii>=mid
      e=sum(abs(FT_AMFM(1:ii)).^2);
   else
      e=sum(abs(FT_AMFM((mid-ii):(mid+ii))).^2);
   end
end

% random white (pseudo random rather) noise sequence
w=randn(1,L_AMFM);
% w is noise sequence.
if ii>=mid
   fil=fir1(256,ii/(2*L_AMFM)); 
else
   BP_min=(mid-ii)/L_AMFM;	% cut-off frequencies for the Gaussian noise frequency band limiting
   BP_max=(mid+ii)/L_AMFM;
   
   fil=fir1(256,[BP_min BP_max]);  
end

w_conv=conv(w,fil);w=w_conv(129:L_AMFM+128);

mean_w=mean(w);w=w-mean(w);w=w/std(w);

var_AMFM=var(AMFM);
var_noise=var_AMFM*10^(-SNR/10);
noise=w*sqrt(var_noise);

AMFMnoise=AMFM+noise;

% Done


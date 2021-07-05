% Objective: Hilbert transform based AM and FM computation

% Relevant reading: Section 1.3.1 on Page 11 of the thesis

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% AMFM: Am-FM signal

% Output: 
% est_AMht: Hilbert transform based AM
% est_FMht: Hilbert transform based FM

% =======================================================================================


function [est_AMht,est_FMht]=HT(AMFM);

L_AMFM=length(AMFM);
L_HT=101;			% Hilbert transformer impulse response length = 2L_HT +1

[HTh]=HT_impres(L_HT);		%HTh is the hilbert transformer filter response.

% Window the impulse response
windo=hamming(2*L_HT+1);windo=windo/max(windo);
HTh=HTh.*windo';

% Convolve the AMFM signal with the Hilbert transform impulse response
HT_AMFM_conv=conv(AMFM,HTh);

% Compute the analytic signal
HT_AMFM=AMFM+j*HT_AMFM_conv(L_HT+1:L_AMFM+L_HT);

% Analytic signal amplitude
est_AMht=abs(HT_AMFM);

% Instantaneous phase
est_phaiht=unwrap(angle(HT_AMFM));%estimated phase

% Instantaneous frequency
est_FMwht=zeros(1,L_AMFM);%estimated freqeuncy in radian.

% Instantaneous frequency by differencing instantaneous phase (first-order approximation)
for ii=2:L_AMFM,
   est_FMwht(ii)=est_phaiht(ii)-est_phaiht(ii-1);
end

% boundary effect correction (arbitrary correction)
est_FMwht(1)=est_FMwht(2);

% radians to linear frequency scale
est_FMht=est_FMwht/(2*pi);

% Done


% Objective: To compute AM and FM by using piecewise linear auditory filters

% Relevant reading: Pages 13 and 14 of the thesis (Sec.1.3.3 and the references within)
% TF Quatieri, TE Hanna and GC O'Leary, "AM-FM separation using auditory motivated filters",
% IEEE Trans. on Speech and Audio Proc., Vol. 5, No. 5, pp. 465-480, Sep. 1997.

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: Aud_L_impres.m, hilbertxf.m

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% AMFM: AM-FM signal

% Output: 
% est_AMaudl: AM computed using Gaussian auditory filters
% est_FMaudl: FM computed using Gaussian auditory filters

% =======================================================================================


function [est_AMaudl,est_FMaudl]=Aud_L(AMFM);
AMFMaud=AMFM+j*hilbertxf(AMFM);

L_AMFM=length(AMFM); 
L_linearF=151;    % Filter impulse response length

if rem(L_linearF,2)==0
   start=L_linearF/2+1;
   finish=L_AMFM+L_linearF/2;
else
   start=(L_linearF+1)/2;
   finish=L_AMFM+(L_linearF-1)/2;
end 

% Between the "start" and "finish" points only, estimation will be performed

% Specific choice of cutoff frequencies. Read the paper indicated above (comments at the top of this page)
% for more details on the choice of the cutoff frequency.
% The choice of the filters is input-dependent.

% Critical frequencies of the filters
lfw11=0;lfw12=0.36;lfw13=0.44; 
lfw21=0.02;lfw22=0.36;lfw23=0.48;

% Auditory filter impulse response
[lfh1]=Aud_L_impres(lfw11,lfw12,lfw13,L_linearF);
[lfh2]=Aud_L_impres(lfw21,lfw22,lfw23,L_linearF);

% Convolution
lfy1_conv=conv(AMFMaud,lfh1);
lfy2_conv=conv(AMFMaud,lfh2);
lfy1=lfy1_conv(start:finish);
lfy2=lfy2_conv(start:finish);

% Piecewise linear filter parameters
a1=1/(2*pi*(lfw12-lfw11));a2=1/(2*pi*(lfw22-lfw21));
b1=-1*lfw11/(lfw12-lfw11);b2=-1*lfw21/(lfw22-lfw21);

% AM and FM estimation
est_AMaudl=(a2*abs(lfy1)-a1*abs(lfy2))/(a2*b1-a1*b2);
est_FMaudl=((b2*abs(lfy1)-b1*abs(lfy2))./(a1*abs(lfy2)-a2*abs(lfy1)))/(2*pi);

% Done


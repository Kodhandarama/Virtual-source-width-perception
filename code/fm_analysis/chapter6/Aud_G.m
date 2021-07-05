% Objective: To compute AM and FM by using Gaussian auditory filters

% Relevant reading: Pages 13 and 14 of the thesis (Sec.1.3.3 and the references within)
% TF Quatieri, TE Hanna and GC O'Leary, "AM-FM separation using auditory motivated filters",
% IEEE Trans. on Speech and Audio Proc., Vol. 5, No. 5, pp. 465-480, Sep. 1997.

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: Aud_G_impres.m, hilbertxf.m

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% AMFM: AM-FM signal

% Output: 
% est_AMaudg: AM computed using Gaussian auditory filters
% est_FMaudg: FM computed using Gaussian auditory filters

% =======================================================================================


function [est_AMaudg,est_FMaudg]=Aud_G(AMFM);

L_AMFM=length(AMFM); 	% Length of the input AM-FM signal
L_gaussF=151;    	% Length of the Gaussian filter impulse response

w=0:(2*pi)/(L_gaussF-1):2*pi;	% frequency in radians


% The start and finish points of the input AM-FM signal where estimation is done
if rem(L_gaussF,2)==0
   start=L_gaussF/2+1;
   finish=L_AMFM+L_gaussF/2;
else
   start=(L_gaussF+1)/2;
   finish=L_AMFM+(L_gaussF-1)/2;
end 


AMFMaud = AMFM + j*hilbertxf(AMFM);	% Analytic signal of AMFM

% Gaussian filter center frequencies
gf1_centf=80*pi/180;    
gf2_centf=100*pi/180;    


% Gaussian filters' parameters (see relevant reading)
gfw1=0.01; 
a1g=-log(0.01)/((gfw1-gf1_centf)^2); 
a2g=a1g;

% Gaussian filter impulse responses
[gfh1]=Aud_G_impres(L_gaussF,gf1_centf,a1g); 
[gfh2]=Aud_G_impres(L_gaussF,gf2_centf,a2g);

% Convolution of input (complex) AM-FM signal with the filter impulse response
gfy1_conv=conv(AMFMaud,gfh1);
gfy2_conv=conv(AMFMaud,gfh2);
gfy1=gfy1_conv(start:finish);
gfy2=gfy2_conv(start:finish);

% AM and FM estimation equations
un=(log(abs(gfy2)./abs(gfy1)))/a1g;
est_FMaudg=(un-(gf1_centf^2-gf2_centf^2))/(-2*(gf1_centf-gf2_centf));
gfH1wn=exp(-a1g*((est_FMaudg-gf1_centf).^2));
est_AMaudg=abs(gfy1)./abs(gfH1wn);
est_FMaudg=est_FMaudg/(2*pi);


% Done



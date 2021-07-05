% Objective: To obtain the Gaussian auditory filter impulse response

% Relevant reading:  TF Quatieri, TE Hanna and GC O'Leary, "AM-FM separation using auditory motivated filters",
% IEEE Trans. on Speech and Audio Proc., Vol. 5, No. 5, pp. 465-480, Sep. 1997.

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% L_gaussF: Gaussian filter impulse response length 
% g1_centf: center frequency
% a: Gaussian width parameter

% Output: 
% gh = Gaussian filter impulse response

% =======================================================================================

function [gh]=Aud_G_impres(L_gaussF,g1_centf,a);

gh=zeros(1,L_gaussF);
if rem(L_gaussF,2)==0
   nn=-L_gaussF/2:L_gaussF/2-1;
else
   nn=-(L_gaussF-1)/2:(L_gaussF-1)/2;
end

% straightforward
ww=0:pi/(L_gaussF-1):pi;
gh1=(exp(a*(((g1_centf+(j*nn)/(2*a)).^2)-g1_centf^2)))/(2*pi);
for ii=nn,
    gh2(ii+(L_gaussF+1)/2)=sum(exp(-a*((ww-(g1_centf+(j*ii)/(2*a))).^2)));
end
gh=gh1.*gh2;
gh=gh/(max(abs(fft(gh))));

% Done


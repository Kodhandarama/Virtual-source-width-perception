% Objective: To obtain the piecewise linear auditory filter impulse response

% Relevant reading:  TF Quatieri, TE Hanna and GC O'Leary, "AM-FM separation using auditory motivated filters",
% IEEE Trans. on Speech and Audio Proc., Vol. 5, No. 5, pp. 465-480, Sep. 1997.

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% lfw1, lfw2, lfw3: Linear filter frequency domain parameters w1,w2,w3 (omega 1, omega2, omega3)
% See the above "Relevant reading" for more details
% L_linearF: Length of the piecewise-linear filter impulse response

% Output: 
% lfh = Piecewise-linear filter impulse response

% =======================================================================================


function [lfh]=Aud_L_impres(lfw1,lfw2,lfw3,L_linearF);

ww1=lfw1*2*pi*L_linearF/(L_linearF-1);
ww2=lfw2*2*pi*L_linearF/(L_linearF-1);
ww3=lfw3*2*pi*L_linearF/(L_linearF-1);
ww4=2*pi;

lfh=zeros(1,L_linearF);		% contains the piecewise-linear filter impulse response
if rem(L_linearF,2)==0
   nn=-L_linearF/2:L_linearF/2-1;
else
   nn=-(L_linearF-1)/2:(L_linearF-1)/2;
end
if rem(L_linearF,2)==0
   mid_pt=L_linearF/2+1;
else
   mid_pt=(L_linearF+1)/2;
end

if rem(L_linearF,2)==0
   start=L_linearF/2+1;
else
   start=(L_linearF+1)/2;
end


% impulse response calculation
for ii=nn,
   if ii==0
      lfh(mid_pt)=0.25*(ww3-ww1)/pi;
   else
      lfh(ii+start)=(1./(2*ii*pi*j*(ww2-ww1))).*...
       (exp(j*ww2*ii).*(ww2-1./(j*ii)-ww1)+exp(j*ww1*ii)./...
       (j*ii))+(1./(2*ii*pi*j*(ww2-ww3))).*(exp(j*ww2*ii).*...
       (ww3+1./(j*ii)-ww2)-exp(j*ww3*ii)./(j*ii));
   end
end

% Done



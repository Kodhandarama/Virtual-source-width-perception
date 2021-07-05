% Objective: To obtain the DESA-2 estimates of AM and FM

% Relevant reading: P Maragos, JF Kaiser and TF Quatieri, "Energy separation in signal modulations with application to 
% speech analysis", IEEE Trans. on Sig. Proc., Vol. 41, No. 10, pp. 3024-3050, Oct. 1993.

% Author: S Chandra Sekhar (PhD, ECE, IISc) and Jitendra Kumar Gupta

% Dependencies: DESA2_E.m

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% AMFM: real-valued AMFM signal

% Output: 
% e_AMdesa2: computed/estimated AM using DESA-2
% e_FMdesa2: computed/estimated FM using DESA-2
% =======================================================================================


function [e_AMdesa2,e_FMdesa2]=DESA2(AMFM);

L_AMFM=length(AMFM);	% input AM-FM signal length

% Difference function
diff2y=zeros(1,L_AMFM);
for ii=2:L_AMFM-1,
   diff2y(ii)=AMFM(ii+1)-AMFM(ii-1);
end
diff2y(1)=diff2y(2);
diff2y(L_AMFM)=diff2y(L_AMFM-1);

% DESA-2E for TEO computation 
[SAI2_AMFM]=DESA2_E(AMFM);
[SAI2_y]=DESA2_E(diff2y);


% Estimating the AM and FM components
% simple and straightforward implementation of the DESA-2 algorithm
% read the "Relevant reading" above for the equations

e_FMdesa2=zeros(1,L_AMFM);
e_AMdesa2=zeros(1,L_AMFM);
for ii=1:L_AMFM,
   if SAI2_AMFM(ii)<=0.000000001 & ii>1,
      e_AMdesa2(ii)=0;
      e_FMdesa2(ii)=e_FMdesa2(ii-1);
   else
      e_FMdesa2(ii)=0.5*acos(1-SAI2_y(ii)/(2*SAI2_AMFM(ii)));
   
      e_AMdesa2_num=2*SAI2_AMFM(ii);
      e_AMdesa2_den=sqrt(SAI2_y(ii));
      e_AMdesa2(ii)=e_AMdesa2_num/e_AMdesa2_den;
   end
end
e_FMdesa2=e_FMdesa2/(2*pi);


% Done



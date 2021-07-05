% Objective: Program to compute the AM and FM using DESA-1 algorithm

% Relevant reading: Sec.1.3.4 on Page 15 of the thesis

% Authors: Jitendra Kumar Gupta and S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: DESA1_E.m

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input: 
% AMFM: AM-FM signal

% Output:
% est_AMdesa1: AM estimate
% est_FMdesa1: FM estimate

% ======================================================================================


function [est_AMdesa1,est_FMdesa1]=DESA1(AMFM);
L_AMFM=length(AMFM);

% Difference function
for ii=2:L_AMFM,
   diff1y1(ii)=AMFM(ii)-AMFM(ii-1);
end
for ii=1:L_AMFM-1,
   diff1y2(ii)=AMFM(ii+1)-AMFM(ii);
end
diff1y2(L_AMFM)=diff1y2(L_AMFM-1);
diff1y1(1)=diff1y1(2);

% TEO of the signal and difference (forward and backward) signals
[E1_AMFM]=DESA1_E(AMFM);
[E1_y1]=DESA1_E(diff1y1);
[E1_y2]=DESA1_E(diff1y2);

E1_y=(E1_y1+E1_y2)/2; 	% Averaging of forward and backward difference signals TEOs


% AM and FM computation using DESA1

for ii=1:L_AMFM,
   if E1_AMFM(ii)<=0.000000001 & ii>1,
      est_AMdesa1(ii)=0;
      est_FMdesa1(ii)=est_FMdesa1(ii-1);
   else
      est_FMdesa1(ii)=real(acos(1-E1_y(ii)/(2*E1_AMFM(ii))));
      est_AMdesa1_num=E1_AMFM(ii);
      est_AMdesa1_den=1-(1-(E1_y(ii)/(2*E1_AMFM(ii))))^2;
      est_AMdesa1(ii)=real(sqrt(abs(est_AMdesa1_num/est_AMdesa1_den)));
   end
end
est_FMdesa1=est_FMdesa1/(2*pi);


% Done




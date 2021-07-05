% Objective: To obtain the PTFD based FM estimate

% Relevant reading: Ref [95] on Page 189

% Author: Jitendra Kumar Gupta and S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: 

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% PTFD: the positive time-frequency distribution
% L_AMFM: length of the AM-FM signal

% Output: 
% est_FMptfd: FM estimated using the PTFD technique

% =======================================================================================


function [est_FMptfd]=PTFD_FM(PTFD,L_AMFM);


N_half=length(PTFD(:,1));	

freq=0:0.5/(N_half-1):0.5;	% Frequency 

% Code below is suitable for noisy signal. It uses peak picking technique.

% x=1:N_half;
% for ii=1:L_AMFM,
%   y=TFR(:,ii); xi=1:0.01:N_half;
%   yi=interp1(x,y,xi,'spline');
%   [yi_max,yi_max_pos]=max(yi);
%   est_FM(ii)=yi_max_pos*0.5/(N_half*100+1);
% end


% See relevant reading above. This is straightforward moment computation

for ii=1:L_AMFM,
   est_FMptfd_num=sum(freq.*transpose(PTFD(:,ii)));
   est_FMptfd_den=sum(PTFD(:,ii));
   if est_FMptfd_den<=0.0000001
      if ii>1
          est_FMptfd(ii)=est_FMptfd(ii-1);
       end
   else
      est_FMptfd(ii)=est_FMptfd_num/est_FMptfd_den;
   end
end

% Done




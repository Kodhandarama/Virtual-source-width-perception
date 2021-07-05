% Objective: To generate different windows

% Author: Jitendra Kumar Gupta and S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% L_win: length of the window
% win_type: type of the window (for ex, a value of 2 refers to Hamming window)

% Output: 
% win: desired window 

% =======================================================================================


function win = win_stft(L_win,win_type);

win=zeros(1,L_win);

switch  win_type
   case 1,
        ww=boxcar(L_win);        
   case 2,
        ww=hamming(L_win);
   case 3,
        ww=hanning(L_win);
   case 4,
      ww=bartlett(L_win);
   case 5,
      ww=blackman(L_win);
   case 6,
      ww=chebwin(L_win,1);
   case 7,
      ww=kaiser(L_win,2.629);
   case 8,
      ww=triang(L_win);
      
end
   
for i=1:L_win,
   win(1,i)=ww(i);
end

return

% Done




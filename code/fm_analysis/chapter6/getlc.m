% Objective: Program to find the zero-crossings of a signal

% Principle: Checks for change of sign to detect the presence of a zero-crossing
% The zero-crossing position/instant is localized to higher accuracy by using 
% the method of bisection (same as the technique used in polynomial root finding problems)

% Relevant reading: Sec 2.1.1 on Page 31 of the thesis

% Author: S Chandra Sekhar, PhD, ECE, IISc

% Dependencies: interpolate.m

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================


% Input: 
% signal: signal (row/column vector) 
% deltan: the sampling interval (scalar)

% Output: an array containing zero-crossings 


function lc_signal=getlc( al,v_l,idx_ex_l ,cnt);

lc=[];		% array to contain the zero-crossings, initialized to null

for i=1:length(v_l)-1	%Scan through the entire signal length
%    i
    ext1 = idx_ex_l(i);
    ext2 = idx_ex_l(i+1);
    
    level = v_l(i) + (v_l(i+1) - v_l(i) ) * [1 2 3 4]/5 ; 
    
    for j = 1 : cnt
        signal = al(ext1:ext2) - level(j); 
        deltan = 1/48000; 
        zc = getzeros(signal,deltan); 
        if length(zc) == 1
            lc(i,j) = ext1+zc; 
        else
            lc(i,j) = ext1+0; 
        end
    end% End of if

end				% End of for loop
lc_signal = reshape(lc',size(lc,1)*size(lc,2),1);

%int

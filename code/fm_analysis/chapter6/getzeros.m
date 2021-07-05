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


function zcs=getzeros(signal,deltan);

zcs=[];		% array to contain the zero-crossings, initialized to null

for i=1:length(signal)-1	%Scan through the entire signal length
%    i
	if signal(i)==0		% Signal value = 0
	zcs=[zcs (i-1)*deltan];	% The corresponding time instant is the zero-crossing instant
	end			% End of if

	if signal(i)*signal(i+1)<0	% If change of sign between i and i+1 instants (=> ZC between i and i+1)
     %   i
        %int= interpolate(i,signal,deltan,20);	% Use the interpolate.m function to find the exact instant 
    % <arthi Feb 26 2019> commenting interpolate fn to save time by taking
    % simple averaging 
    s_interpolate = signal(i) + (signal(i+1) - signal(i))*[0:1000-1]/1000 ; 
    [min_val,idx] =  min(abs(s_interpolate))  ;
    zcs=[zcs i+idx/1000];
	%zcs=[zcs int];				% Save the zero-crossing instant
	end					% End of if

end				% End of for loop

%int

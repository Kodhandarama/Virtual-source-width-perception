% Objective: Program to localize the zero-crossing of a signal

% Principle: Checks for change of sign to detect the presence of a zero-crossing
% The zero-crossing position/instant is localized to higher accuracy by using 
% the method of bisection (same as the technique used in polynomial root finding problems)
% Here we use the sinc interpolation/bandlimited interpolation technique

% Relevant reading: Sec 2.1.1 on Page 31 of the thesis 

% Author: S Chandra Sekhar, PhD, ECE, IISc

% Dependencies: none
        
% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com
        
% Date of documentation: 05 Feb 2006

% =======================================================================================

        
% Input: 
% i: instant (discrete-time scalar) after which ZC has been detected (i.e ZC exists between i and i+1)
% signal: signal (row/column vector)
% deltan: the sampling interval (scalar)
% X: No. of iterations of the bandlimited interpolation scheme

% Output:
% instant: zero-crossing instant

function instant=interpolate(i,signal,deltan,X);

LL=(i-1)*deltan;	% Lower limit of the interval
UL=i*deltan;		% Upper limit of the interval
ML=(LL+UL)/2;		% Mid point of the interval
for loop=1:X		% 10 iterations of the bandlimited interpolation technique
    loop
	atML=0;		% signal value at midpoint, initialized to zero.

			% For loop: Compute the signal value at ML using the bandlimited interpolation formula
	for n=1:length(signal)
	timefac=(ML-(n-1)*deltan)/deltan;
	atML=atML+signal(n)*sinc(timefac);
	end		% End of for loop
			% atML is the value of the signal at ML

	if signal(i)*atML<0	% If sign change between i and ML, zero-crossing exists between i and ML
	UL=ML;			% Refine search by reducing the UL to ML
	ML=(LL+UL)/2;		% New ML
	else			% Change of sign is between ML and i+1, zero-crossing exists between ML and i+1
	LL=ML;			% Refine search by assigning ML to LL
	ML=(LL+UL)/2;		% New ML
	end			% End of if else condition

end				% End of for loop (for number of iterations)
instant=ML;			% The mid point of the interval after 10 iterations is the zero-crossing instant



% Objective: AM-FM signal generation with exponential AM and linear FM

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================


N=512;			% signal length	
n=0:N-1;		% discrete-time instants
am = exp(-1.2*n/N);	% AM	
fm=0.1:0.1/(N-1):0.2;	% FM
pm=cumsum(fm);		% approximate integration by summation
amfm=am.*sin(2*pi*pm);  % AM-FM signal


% Done



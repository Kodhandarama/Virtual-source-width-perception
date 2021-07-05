% Objective: Program to obtain the Hilbert transform of a signal

% Relevant reading: Oppenheim's book on Digital Signal Processing (Chapter on Hilbert transforms)

% IMPORTANT NOTE: MATLAB's hilbert transform code is DFT based and is seriously flawed. It has aliasing problems. 
% Hence, this code.

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input: 
% x: signal whose Hilbert transform is desired

% Output:
% ch: Hilbert transform of the signal (if x is real-valued, ch is real-valued)

% ======================================================================================


function ch = hilbertxf(x)

% Hilbert transform impulse response
N=256;	% Impulse response length
n=-0.5*N:-1;
h=(2*(sin(pi*n/2)).^2)./(pi*n);
n=1:0.5*N;
h=[h 0 (2*(sin(pi*n/2)).^2)./(pi*n)];

% Window the impulse response
h=h.*hamming(N+1)';

% Convolve the input with the input signal
ch=conv(x,h);

% Retain essential portion of the output 
% (strip off samples at the beginning and the end)
ch=ch(0.5*N+1:end-0.5*N);


% Done

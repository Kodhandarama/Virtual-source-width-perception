% Objective: Time-varying lowpass filter implementation

% Relevant reading: Sec. 6.1.2, Page 109 of the thesis

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% x: input signal
% wc: lowpass filter cutoff frequency (a vector denoting the instantaneous cutoff frequency)
% L: impulse response length of the filter
% N: length of x

% Output: 
% filtered: filtered signal

% ======================================================================================

function filtered=tvlpf(x,wc,L,N);

j1=-L/2:-1;		% indices to the left of the filter impulse response peak(center since it is a sinc function)
j2=1:L/2;		% indices to the right
% the need for this separation will become clear in the for loop below (to avoid the sin(0)/0 numerical problem)

x=reshape(x,1,N);
x=[zeros(1,L/2) x zeros(1,L/2)];	% zero-padding for FIR convolution
wc=[zeros(1,L/2) wc zeros(1,L/2)];
N=length(x);


filtered=[];
for i=L/2+1:N-L/2
h1=2*(sin(wc(i)*j1)./j1);	% left half impulse response
h2=2*(sin(wc(i)*j2)./j2);	% right half impulse response
h=[h1 2*wc(i) h2];h=h/(2*pi);	% the center value would give rise to NaN if not implemented in this way

h=h.*hamming(length(h))';	% hamming windowed response

filtered=[filtered sum(x(i-L/2:i+L/2).*h)];	% filtered signal stacked up
end


% Done





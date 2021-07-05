% Objective: Hilbert transform impulse response 

% Relevant reading: Read the chapter on Hilbert transforms in DSP by Oppenheim and Schafer

% Authors: Jitendra Kumar Gupta and S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% L_HT: (Length of Hilbert transform - 1)/2

% Output: 
% estimate: k-NN technique based IF estimate

% =======================================================================================


%This program finds out the impulse response of a hilbert transformer.
function h = HT_impres(L_HT);

n=-L_HT:L_HT;	% time instants

warning off			% to suppress the 'divide by zero' warning for n=0 in the next line
h=2*(sin(pi*n/2).^2)./(pi*n);	% impulse response
h(L_HT+1)=0;			% center value of the impulse response (correction for n=0)	
warning on			% warning status back to 'on'

% Done


% Objective: Constant AM and constant FM generation

% Author: JK Gupta and S Chandra Sekhar, PhD scholar, ECE, IISc

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% AMFM generation
N=512;
L=512;
wl=128;
n=0:N-1;

% AM
hAM=fir1(L,0.04);
AM=3*ones(1,N);
win=hamming(wl);
AM(1:wl/2)=AM(1:wl/2).*win(1:wl/2)';
AM(end-wl/2+1:end)=AM(end-wl/2+1:end).*win(wl/2+1:end)';

% FM
FM=0.23*ones(1,N);PM=cumsum(FM);

amfm=AM.*sin(2*pi*PM);

% Done


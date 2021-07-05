% Objective: To obtain the AM and FM using the positive time-frequency distribution technique

% Relevant reading:  Ref [95], Page 189 of the thesis

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: win_stft.m, PTFD_PTFD_spectgm.m, PTFD_FM.m, PTFD_AM.m

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% AMFM: input AM-FM signal

% Output: 
% est_AMptfd: AM estimated using the PTFD technique
% est_FMptfd: FM estimated using the PTFD technique

% =======================================================================================


function [est_AMptfd,est_FMptfd,ptfd]=PTFD(AMFM);

win_type=2; 	% Type of window used (see win_stft.m for the effect of this parameter)
L_win=32;	% Length of window	

L_AMFM=length(AMFM);	% Input signal length

N=L_AMFM; 		% N: the DFT size 

n=0:L_AMFM-1;		% time indices corresponding to the AMFM signal

[win]=win_stft(L_win,win_type); 	% generate the window

[spectgm]=PTFD_PTFD_spectgm(win,AMFM,L_AMFM,n,L_win,N);	% get the spectrogram

[ptfd]=PTFD_PTFD(spectgm,AMFM,L_AMFM,n,L_win);		% using the spectrogram initialization
							% compute the PTFD

[est_FMptfd]=PTFD_FM(ptfd,L_AMFM);	% PTFD based FM estimation

[est_AMptfd]=PTFD_AM(AMFM,L_AMFM,est_FMptfd,L_win);	% PTFD based AM estimation

% Done




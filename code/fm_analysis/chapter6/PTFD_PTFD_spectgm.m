% Objective: Spectrogram computation used as initialization for the PTFD technique

% Author: Jitendra Kumar Gupta and S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% win: window values
% AMFM: input AM-FM signal
% L_AMFM: length of the AM-FM signal
% L_win: length of the window
% N: frequency domain length of the PTFD/spectrogram

% Output: 
% spectgm: Spectrogram output

% =======================================================================================

function [spectgm]=PTFD_PTFD_spectgm(win,AMFM,L_AMFM,n,L_win,N);

spectgm=zeros(L_AMFM,N);	% 'spectgm' is one sided (in frequency) spectrogram matrix
spectgm_sym=zeros(L_AMFM,N);	% 'spectgm_sym' is both sided spectrogram matrix

win_seq=zeros(1,L_win);		% 'win_seq' is the windowed sequence at a time
win_seq_fft=zeros(1,N);		% DFT of 'win_seq'

if rem(L_win,2)==0
   start=L_win/2;
else
   start=L_win/2+0.5;
end

% Zero-padding at either ends
AMFM_extra=zeros(1,2*start+L_AMFM);
AMFM_extra(start:L_AMFM+start-1)=AMFM(:);

% Straightforward spectrogram computation
for ii=1:L_AMFM,
      win_seq(1,:)=win(1,:).*AMFM_extra(ii:ii+L_win-1);
      win_seq_fft=fft(win_seq,N);
      spectgm(ii,: )=win_seq_fft;
      spectgm_sym(ii,:)=abs(spectgm(ii,:));
end
spectgm_sym=spectgm_sym.*spectgm_sym;
spectgm_sym=transpose(spectgm_sym);

spectgm=zeros(N,L_AMFM);spectgm(:)=spectgm_sym(:);


% Done

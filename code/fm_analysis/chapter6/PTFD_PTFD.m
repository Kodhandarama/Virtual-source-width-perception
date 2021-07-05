% Objective: To compute the PTFD (iterative technique) with spectrogram initialization

% Relevant reading: Ref [95] on Page 189 (the same notation is used in the code too)

% Author: Jitendra Kumar Gupta and S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: Taken from Time-frequency toolbox

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% spectgm: Spectrogram (used as initialization for the PTFD iterations)
% AMFM: input AM-FM signal
% L_AMFM: length of the AM-FM input signal
% L_win: length of the window used for spectrogram computation

% Output: 
% PTFD: Positive time-frequency distribution

% =======================================================================================


function PTFD = PTFD_PTFD(spectgm,AMFM,L_AMFM,n,L_win);

FT_AMFM=fft(AMFM);	% spectrum of AM-FM signal (for marginal computation) 
m0_f=abs(FT_AMFM).^2;	% Frequency marginal

mag=spectgm;		% Input PTFD initialization (spectrogram)
	
m0_t=abs(AMFM).^2;	% Time marginal

% Initialization so that the while loop is executed at least once
Pcap_t=zeros(1,L_AMFM);Pcap_t(1,10)=max(m0_t)+1;
qcap_f=zeros(1,L_AMFM);qcap_f(1,10)=max(m0_f)+1;

trial=1;		% Iteration index of the PTFD computation technique

while max(abs(Pcap_t-m0_t))>0.001 | max(abs(qcap_f-m0_f))>0.001 | trial<20	% While marginals get accurate
										% or no. of trials is less than limit

% Implementation of the iterations
   
   for ii=1:L_AMFM,
      Pcap_t(ii)=sum(mag(:,ii))/L_AMFM;
      lambda0_t(ii)=log(Pcap_t(ii)/m0_t(ii));
      Q0_tf(:,ii)=mag(:,ii)*exp(-lambda0_t(ii));
   end
   mag=Q0_tf;
     
   for ii=1:L_AMFM,
      qcap_f(ii)=sum(mag(ii,:));
      lambda0_f(ii)=log(qcap_f(ii)/m0_f(ii));
      Q1_tf(ii,:)=mag(ii,:)*exp(-lambda0_f(ii));
   end
   mag=Q1_tf;
trial=trial+1;
end

PTFD=mag(1:L_AMFM/2,:);
       
% Done




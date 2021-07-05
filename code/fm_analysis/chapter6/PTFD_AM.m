% Objective: To obtain the envelope estimate using the PTFD technique

% Relevant reading:  Ref [95], Page 189

% Author: Jitendra Kumar Gupta and S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% AMFM: AM-FM signal
% L_AMFM: length of the AM-FM signal
% est_FMptfd: PTFD-based FM estimate
% L_win: length of the window used in computing the PTFD

% Output: 
% est_AMptfd: PTFD-based AM estimate

% =======================================================================================


function est_AMptfd = PTFD_AM(AMFM,L_AMFM,est_FMptfd,L_win);

est_FMwptfd=est_FMptfd*2*pi;	% 'est_FMwptfd' is in radians and 'est_FMwptfd' is in Hz. 
for i=1:L_AMFM,
   phai(i)=sum(est_FMwptfd(1:i));
end

% Envelope estimation

fil_len_hlp=32; 	% 'fil_len_hlp' is length of the time varying filter
hlp=zeros(1,L_AMFM);	% 'hlp' is the impulse response of the time varying filter

est_AMptfd=zeros(1,L_AMFM); 	% estimated AM length

% Arrays to store the in-phase and quadrature-phase envelopes
A_I=zeros(1,L_AMFM);      
A_Q=zeros(1,L_AMFM);

% zero-pad (for FIR filtering boundary effects)
AMFM_extra=zeros(1,L_AMFM+fil_len_hlp);
AMFM_extra(1,fil_len_hlp/2:fil_len_hlp/2+L_AMFM-1)=AMFM(1,:);
phai_extra=zeros(1,L_AMFM+fil_len_hlp);
phai_extra(1,fil_len_hlp/2:fil_len_hlp/2+L_AMFM-1)=phai(1,:);

est_FMptfdextra=zeros(1,L_AMFM+fil_len_hlp);est_FMptfdextra(:)=est_FMptfd(1);
est_FMptfdextra(1,fil_len_hlp/2:fil_len_hlp/2+L_AMFM-1)=est_FMptfd(1,:);

% Time-varying coherent demodulation
cos_phai=zeros(1,fil_len_hlp+1);
sin_phai=zeros(1,fil_len_hlp+1);
for ii=1:L_AMFM,
   hlp=fir1(fil_len_hlp,est_FMptfdextra(ii)*2,kaiser(fil_len_hlp+1,4));
   cos_phai(1,:)=cos(phai_extra(1,ii:ii+fil_len_hlp));
   sin_phai(1,:)=sin(phai_extra(1,ii:ii+fil_len_hlp));
   A_I(ii)=sum(AMFM_extra(ii:ii+fil_len_hlp).*cos_phai.*hlp);	% In-phase component
   A_Q(ii)=sum(AMFM_extra(ii:ii+fil_len_hlp).*sin_phai.*hlp);	% Quadrature-phase component
end

% Envelope from in- and quadrature- phase components
est_AMptfd=abs(A_I+j*A_Q)*2;  

% Done



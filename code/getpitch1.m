%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This method is to synthesize the time-varying pitch glides
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [e,pitch] = getpitch1(t,p1,p2,p3,fs,ptype)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% input : 
%   t           - time,
%   p1          - starting pitch,
%   p2          - ending pitch for 'l' type, intermediate pitch for V or inv-V shaped pitch glide 'p',
%   p3          - ending pitch for V or inv-V shaped pitch glide 'p',
%   fs          - sampling frequency 
%   ptype       - pitch glide type. Takes value 'l' or 'p' denoting
%                  'linear' or 'V' type pitch glides
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output: 
%   e           - Excitation as sum of impulses 
%   pitch       - Instantaneous pitch
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Function synthesizing instantaneous pitch 
    pitch = pitch_glide_linear(ptype,t,p1,p2,p3,fs);

% To synthesize excitation as sum of impulses 
    pitch_sample = round(1./pitch*fs);

    n(1) = 1; 
    m = 1;
    k = 2;

    while(m <= length(t) ) 
        f_0_dash_sample = pitch_sample(m);
        m = m + f_0_dash_sample ;
        n(k) = m;
        k = k+1;
    end

    I = find(n <= length(t) );

    n = n(I);

    e = zeros(size(t));

    e(n) = 1;

end
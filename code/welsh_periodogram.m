%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function to specify parameters for synthesis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function variable_data_exp2()

T = 6;            % Time duration
duration = T;     % Time duration
fs = 48000;         % Sampling frequency

form_freq = [
%             270 2290 3010 3781 4200;    % 1  /i/
            292 2478 2967 3845 4411; %16khz 
            390 1990 2550 3781 4200 ;   % 2  /I/
            530 1840 2480 0 0;          % 3
            660 1720 2410 0 0 ;         % 4
            520 1190 2390 0 0 ;         % 5
%             730 1090 2440 3781 4200;    % 6  /a/
            787 2807 3515 4552 4552;
            570 840 2410 3406 4200;     % 7
            440 1020 2240 3406 4200;    % 8
%             300 870 2240 3406 4200;     % 9  /u/
            264 716 1970 3955 5123;
            490 1350 1690 0 0];         % 10

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Band-width details from Rabiner and Juang and Cheveign 1999
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bw = [38 66 171 309.34 368;             % 1  /i/
      42 71 142 309.34 368;             % 2  /I/ 
      0 0 0 0 0 ;                       % 3  
      0 0 0 0 0 ;                       % 4  
      0 0 0 0 0;                        % 5  
      60 50 102 309.34 368;             % 6  /a/
      47 50 98 256.84 368;              % 7  
      51 61 90 256.84 368 ;             % 8  
      50 58 107 256.84 368;             % 9  /u/
      0 0 0 0 0];                       % 10  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Pitch glide type
%   l - linear 
%   p - to generate V shaped and inv-V shaped pitch glides
%   p1, p2 specify starting and ending pitch for linear pitch glide
%   p1, p3 - specify starting and ending pitch for parabolic pitch glide and
%   p2 specifies intermediate pitch (depth or height) 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ptype = 'l'; % 'l' 'p'  

p1 = 143; %100 * 2.^([0:1:12]/12);
p2 = 143; %100 * 2.^([-3:1:12-3]/12);
p3 = p1; 

% fmax = maximum frequency range required for calculating distance measure
fmax = 10000; 

% alpha1 = corresponds to choosing the starting vowel 1- /i/, 6 - /a/, 9 -/u/
alpha1= 1; 

% alpha2 = corresponds to choosing the ending vowel 1- /i/, 6 - /a/, 9 -/u/
alpha2 = 1;

% t_length_rise_fall = correspondings to number of samples for rise and fall time
t_length_rise_fall = (fs)/16; 

save 'var_data_exp2.mat'
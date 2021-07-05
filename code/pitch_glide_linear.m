%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This method is to synthesize the time-varying pitch glides
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [freq] = pitch_glide_linear(ptype,t,p1,p2,p3,fs)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input : 
%   ptype     - pitch glide type 'l' - linear, 'p' - V or inv-V shaped pitch glide ,
%   t         - time,
%   p1        - starting pitch,
%   p2        - ending pitch for 'l' type, intermediate pitch for V or inv-V shaped pitch glide,
%   p3        - ending pitch for V or inv-V shaped pitch glide,
%   p4        - not used,
%   fs        - sampling frequency 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output: 
%   freq = pitch glide pattern 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

          switch (ptype)
          case 'l'
            points = [ t(1) p1; t(end) p2]; %% linear
          case 'p'
            points = [ t(1) p1; t(end)/2 p2; t(end) p3]; %% parabolic
          case 'c'
            points = [ t(1) p1; t(end)*.4 p2; t(end)*.6 p3;t(end) p4]; %% cubic
      end

    start = t(1);
    start_ind = 1;
    for i = 2:size(points,1)
        length = ceil((points(i,1) - start)*fs+1);
        freq(start_ind:start_ind+length-1) =  points(i-1,2) + (points(i,2) - points(i-1,2))/(length)*( 0:length-1);
        start_ind = start_ind+length;
        start = points(i,1);
    end

end

%       switch (ptype)
%           case 'l'
%             points = [ t(1) p1; t(end) p2]; %% linear
%             freq = p1: (p2 - p1)/((t(end) - t(1))*fs) : p2 ;
%           case 'p'
%             freq(1:t(end)/2*fs) = p1: (p2 - p1)/((t(end)/2 - t(1))*fs) : p2 ; %% V shaped or inv-V shaped
%             freq(t(end)/2*fs+1:t(end)*fs) = p2: (p3 - p2)/((t(end) - t(end)/2)*fs) : p3 ; %% V shaped or inv-V shaped
%       end

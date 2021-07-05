%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This method is to map bandwidth corresponding to the formant frequency
% using piece-wise linear approximation of bandwidth 
% Ref: H K Dunn "Methods of measuring vowel formant bandwidths", JASA
% vol.33, 1961
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This equation is obtained by observing the graph in H K Dunn, JASA 1961
%
%           (55-45)                    
% bw = 55 + ------- * (F - 1000)          0< F <= 1000 
%          (1000-300) 
%
%           (70-65)
%    = 70 + ------- * (F - 2000)          1000< F <= 2000 
%          (2000-1000) 
%          
%           (200-60)
%    = 200 + ------- * (F - 3000)         F > 2000 
%           (3000-2000) 
%           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [bw] = bw_adjust_instantaneous(form_freq)

        bw = zeros(1,10);
        
        for k = 1:10
            if form_freq(k) <= 1000
              bw(k) =  55 + (55 - 45)/(1000 - 300) * (form_freq(k) - 1000); %till 1000
            elseif (form_freq(k) > 1000 && form_freq(k) <= 2000 )
              bw(k)  = 70 + (70 - 65)/(2000 - 1000) * (form_freq(k) - 2000); %till 2000
            elseif form_freq(k) > 2000
              bw(k)  = 200 + (200 - 60)/(3000 - 2000) * (form_freq(k) - 3000); %rest
            end
        end
end

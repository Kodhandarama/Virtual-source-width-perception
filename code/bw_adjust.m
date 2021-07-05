%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This method is to map the initial and final bandwidth 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [bw_from,bw_to] = bw_adjust(alpha1,alpha2,change1,change2,form_freq)
    
        f_from = form_freq(alpha1,:) * (1+change1);
        bw_from = zeros(1,5);
        
        for k = 1:5
            if f_from(k) <= 1000
              bw_from(k) =  55 + (55 - 45)/(1000 - 300) * (f_from(k) - 1000); %till 1000
            elseif (f_from(k) > 1000 && f_from(k) <= 2000 )
              bw_from(k)  = 70 + (70 - 65)/(2000 - 1000) * (f_from(k) - 2000); %till 2000
            elseif f_from(k) > 2000
              bw_from(k)  = 200 + (200 - 60)/(3000 - 2000) * (f_from(k) - 3000); %rest
            end
        end
        
        
        f_to = form_freq(alpha2,:) * (1+change2);
        bw_to = zeros(1,5);
        for k = 1:5
            if f_to(k) <= 1000
              bw_to(k) =  55 + (55 - 45)/(1000 - 300) * (f_to(k) - 1000); %till 1000
            elseif (f_to(k) > 1000 && f_to(k) <= 2000 )
              bw_to(k)  = 70 + (70 - 65)/(2000 - 1000) * (f_to(k) - 2000); %till 2000
            elseif f_to(k) > 2000
              bw_to(k)  = 200 + (200 - 60)/(3000 - 2000) * (f_to(k) - 3000); %rest
            end
        end
end

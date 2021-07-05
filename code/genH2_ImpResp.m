%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This method is to synthesize the time-varying transfer function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [a,x,f1_freq,sigma_freq] = genH2_ImpResp(fs,f_from,f_to,e)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input : 
%
%   fs        -   sampling frequency, 
%   f_from    -   initial formant frequency, 
%   f_to      -   final formant frequency, 
%   e         -   excitation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output: 
%
%   a           - matrix of time-varying polynomial coeffients, 
%   x           - final signal output (vowel or diphthong with required pitch glide), 
%   f1_freq     - time-varying formant frequency matrix, 
%   sigma_freq  - time-varying bandwidth matrix
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%initialisation 

nframe = length(e);
alp = [0:nframe-1]/nframe;
% l_imp = fs*40e-3; 
x = zeros(size(e));
a = zeros(size(e,2),21);
f1_freq = zeros(size(e,2),10); 
sigma_freq = zeros(size(e,2),10); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For every instant transfer function changes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:length(alp)
%    i
    alpha = alp(i);
    
    % Linear interpolation of formant frequency 
    
    f1 =  (1-alpha)*f_from(1) + alpha*f_to(1);  
    f2 =  (1-alpha)*f_from(2) + alpha*f_to(2);  
    f3 =  (1-alpha)*f_from(3) + alpha*f_to(3);  
    f4 =  (1-alpha)*f_from(4) + alpha*f_to(4);  
    f5 =  (1-alpha)*f_from(5) + alpha*f_to(5);  
    f6 =  (1-alpha)*f_from(6) + alpha*f_to(6);  
    f7 =  (1-alpha)*f_from(7) + alpha*f_to(7);  
    f8 =  (1-alpha)*f_from(8) + alpha*f_to(8);  
    f9 =  (1-alpha)*f_from(9) + alpha*f_to(9);  
    f10 =  (1-alpha)*f_from(10) + alpha*f_to(10);
    
    % Bandwidth corresponding to the formant frequencies     
    bw = bw_adjust_instantaneous([f1 f2 f3 f4 f5 f6 f7 f8 f9 f10]);

    sigma1 = bw(1); sigma2 = bw(2); sigma3 = bw(3); sigma4 = bw(4); sigma5 = bw(5);
    sigma6 = bw(6); sigma7 = bw(7); sigma8 = bw(8); sigma9 = bw(9); sigma10 = bw(10);
    
    r(1) = exp(-sigma1*pi/fs);    
    r(2) = exp(-sigma2*pi/fs);    
    r(3) = exp(-sigma3*pi/fs);    
    r(4) = exp(-sigma4*pi/fs);    
    r(5) = exp(-sigma5*pi/fs);
    
    r(6) = exp(-sigma6*pi/fs);    
    r(7) = exp(-sigma7*pi/fs);    
    r(8) = exp(-sigma8*pi/fs);    
    r(9) = exp(-sigma9*pi/fs);    
    r(10) = exp(-sigma10*pi/fs);

    f1_freq(i,:) = [f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 ];  
    sigma_freq(i,:) = [sigma1 sigma2 sigma3 sigma4 sigma5 sigma6 sigma7 sigma8 sigma9 sigma10];  

    pk1 = [ r(1)* exp(f1/fs*2*pi*1i)  r(1)* exp(-f1/fs*2*pi*1i) ] ;

    pk2 = [ r(2)* exp(f2/fs*2*pi*1i)  r(2)* exp(-f2/fs*2*pi*1i) ] ;

    pk3 = [ r(3)* exp(f3/fs*2*pi*1i)  r(3)* exp(-f3/fs*2*pi*1i) ] ;
    
    pk4 = [ r(4)* exp(f4/fs*2*pi*1i)  r(4)* exp(-f4/fs*2*pi*1i) ] ;
    
    pk5 = [ r(5)* exp(f5/fs*2*pi*1i)  r(5)* exp(-f5/fs*2*pi*1i) ] ;
    
    pk6 = [ r(6)* exp(f6/fs*2*pi*1i)  r(6)* exp(-f6/fs*2*pi*1i) ] ;

    pk7 = [ r(7)* exp(f7/fs*2*pi*1i)  r(7)* exp(-f7/fs*2*pi*1i) ] ;

    pk8 = [ r(8)* exp(f8/fs*2*pi*1i)  r(8)* exp(-f8/fs*2*pi*1i) ] ;
    
    pk9 = [ r(9)* exp(f9/fs*2*pi*1i)  r(9)* exp(-f9/fs*2*pi*1i) ] ;
    
    pk10 = [ r(10)* exp(f10/fs*2*pi*1i)  r(10)* exp(-f10/fs*2*pi*1i) ] ;
    
    % all-poles
    pk = [pk1 pk2 pk3 pk4 pk5 pk6 pk7 pk8 pk9 pk10];
    
    % instantaneous polynomial coeffiencts
    a(i,:) = poly(pk) ;
    
    % IIR implementation 
    
    if i>1
        
       if i <= 11
%            l = i;
           x(i) = e(i) - sum( a(i,2:i).*wrev(x(1 : i-1)) );
       else
           l=10;
           x(i) = e(i) - sum( a(i,2:end).*wrev(x(i-l : i-1)) );
       end
       
    else
        x(i) = e(i);
    end
end
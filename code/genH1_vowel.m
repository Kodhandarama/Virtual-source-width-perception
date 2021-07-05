function [a,x,f1_freq,sigma_freq] = genH1_vowel(fs,f_from,sigma_from,e,vowel)

    
    f1 =  f_from(1) ;  
    f2 =  f_from(2) ;  
    f3 =  f_from(3) ;  
    f4 =  f_from(4) ;  
    f5 =  f_from(5) ;  
    f6 =  f_from(6) ;
    f7 =  f_from(7) ;
    f8 =  f_from(8) ;
    f9 =  f_from(9) ;
    f10 =  f_from(10) ;
    
    sigma1 =  sigma_from(1) ;
    sigma2 =  sigma_from(2) ;
    sigma3 =  sigma_from(3) ;
    sigma4 =  sigma_from(4) ;
    sigma5 =  sigma_from(5) ;
    sigma6 =  sigma_from(6) ;
    sigma7 =  sigma_from(7) ;
    sigma8 =  sigma_from(8) ;
    sigma9 =  sigma_from(9) ;
    sigma10 =  sigma_from(10) ;
    
    r(1) = exp(-sigma1*pi/fs);    r(2) = exp(-sigma2*pi/fs);    r(3) = exp(-sigma3*pi/fs);    
    r(4) = exp(-sigma4*pi/fs);    
    r(5) = exp(-sigma5*pi/fs);    
    r(6) = exp(-sigma6*pi/fs);
    
    r(7) = exp(-sigma7*pi/fs);    
    r(8) = exp(-sigma8*pi/fs);    
    r(9) = exp(-sigma9*pi/fs);    
    r(10) = exp(-sigma10*pi/fs);
    
    f1_freq = [f1 f2 f3 f4 f5 f6 f7 f8 f9 f10];  
    sigma_freq= [sigma1 sigma2 sigma3 sigma4 sigma5 sigma6 sigma7 sigma8 sigma9 sigma10];  

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
%     if(vowel == 'a')
%         pk = [pk1 pk2 pk3 pk4 pk5 pk6 pk7 pk8];% pk6 pk7 pk8 pk9 pk10];
%     else
        pk = [pk1 pk2 pk3 pk4 pk5 pk6 pk7 pk8 pk9 pk10];
%     end
    a = poly(pk) ;

%     [h,w] = freqz(sum(a(i,:)),a(i,:),fs/2);
    
%     h_abs(i,:) = abs(h);
    
%     w1 = w*fs/2/pi;
    
%end

    %a = load('a.mat'); 

%     xlabel('Frequency(hz)')
%     ylabel('H(w)^2 (dB)')
%      hold on;
    if(vowel=='a')
        G= 0.0745;
    elseif(vowel=='i')
        G=0.0424;
    else
        G = 0.0075; 
    end
    homega = freqz(G,a,fs,'whole');
    f=1:fs;
%     plot(f,10*log10(abs(homega).^2));
    hold on;
    x= filter(G,a,e);
   
%     z=10*log10(abs(homega).^2)-50;
%     [Peak, PeakIdx] = findpeaks(z,'MinPeakDistance',300,'MinPeakHeight',50);
%     stem(PeakIdx,Peak);
%     text(f(PeakIdx), Peak, sprintf('Peak = %6.3f', Peak))
    

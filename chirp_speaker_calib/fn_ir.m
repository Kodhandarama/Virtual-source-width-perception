function [h_,H_,fs] = fn_ir(file,chn,L)

[data_out,fs]=audioread(file);
from = fix(1.54*fs)+1; to = from+fix((4.5)*fs)-1; % 3.38,234 ; 2.97,326
x_out = data_out(from:to,chn); 

y_out = x_out(.5*fs+1:end); 

Y_out = fft(y_out); 

file_in = './data/chirp_1_6_12k.wav'; 

[data_in,fs]=audioread(file_in);

from = fix(1.5*fs)+1; to = fix((1.5+4.5)*fs); 
x_in = data_in(from:to,1); 
y_in = x_in(.5*fs+1:end); 

Y_in = fft(y_in); 


% T = 4; 
% 
% t = [0:T*fs-1]/fs; 
% 
% f0 = 20; 
% f1 = 16000; 
% if1 = f0 + 2.^(log2(f1-f0)*t/T);
% phi1 = cumsum(if1/fs)*2*pi; 
% x =  sin( phi1 ); 

%Y_in = fft(x'); 

H = Y_out.*conj(Y_in)./abs(Y_in)./abs(Y_in); 

h  = ifft(H,'symmetric');
b= fir1(100,(12000)/(fs/2));
h_f = filter(b,1,h); 

h_ = h_f(780-5:780-5+L);
H_ = fft(h_,fs) ; 

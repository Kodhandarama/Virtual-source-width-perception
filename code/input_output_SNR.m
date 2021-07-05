vowel='a';
modsigma = 2;
formant_num=3;
x= -20:80;
s = 101;
H = zeros(1,s);
for r = -20:80
%     disp(r)
%     H(r+61) = synthesis_vowel_wgn('test_wgnsyn.wav',r,vowel,modsigma);
      H(r+21) =   synthesis_vowel_with_noise_formants("testformantnoise.wav",r,vowel,modsigma,formant_num);
end
hold off;
plot(x,H)
xlabel('Input SNR');
ylabel('Output SNR');
title("Output SNR vs Input SNR");
i=-20;
hold on;
while(i<81)
stem(i,H(i + 21));    
i=i+5;    
hold on;
end

i=-40;
hold on;
while(i<1)
yline(i)
i=i+5;
hold on;
end
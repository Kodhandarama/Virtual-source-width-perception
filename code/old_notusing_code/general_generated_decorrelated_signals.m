function general_generated_decorrelated_signals(inputfile,outputfile)
N = 500000; % sample size
Fs= 48000;
t = (1:N)*(1/Fs);
 
% 1 second =  48000 samples
% 30 ms = 1440 samples

[vowel_sound,Fs] = audioread(inputfile);
r = 615;
sound_array_1 = [zeros(1,r) ,vowel_sound' , zeros(1, 500000 -length(vowel_sound) - r)];
r2 = 547;
sound_array_2 = [zeros(1,r2) ,vowel_sound' , zeros(1, 500000 -length(vowel_sound) - r2)];

r3 = 40;
sound_array_3 = [zeros(1,r3) ,vowel_sound' , zeros(1, 500000 -length(vowel_sound) - r3)];

r4 = 946;
sound_array_4 = [zeros(1,r4) ,vowel_sound' , zeros(1, 500000 -length(vowel_sound) - r4)];

r5 = 335;
sound_array_5 = [zeros(1,r5) ,vowel_sound' , zeros(1, 500000 -length(vowel_sound) - r5)];

r6 = 58;
sound_array_6 = [zeros(1,r6) ,vowel_sound' , zeros(1, 500000 -length(vowel_sound) - r6)];


N_channel_array = zeros(500000,6);
N_channel_array(:,1) = sound_array_1;
N_channel_array(:,2) = sound_array_2;
N_channel_array(:,3) = sound_array_3;
N_channel_array(:,4) = sound_array_4;
N_channel_array(:,5) = sound_array_5;
N_channel_array(:,6) = sound_array_6;

audiowrite(outputfile,N_channel_array,48000)

end

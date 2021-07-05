filename = 'W6_AI_pitchchange_expt1.wav';
filename1 =strcat('/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/expt_1_stimuli/reduce_loudness/',filename);
[soundchannels,Fs] = audioread(filename1);

N=5;

fix_channel1 = soundchannels(:,1)/N;
fix_channel2 = soundchannels(:,2)/N;
fix_channel3 = soundchannels(:,3)/N;
fix_channel4 = soundchannels(:,4)/N;
fix_channel5 = soundchannels(:,5)/N;
fix_channel6 = soundchannels(:,6)/N;

N_channel_array = zeros(494400,6);

N_channel_array(:,1) = fix_channel1';    
N_channel_array(:,2) = fix_channel2';
N_channel_array(:,3) = fix_channel3';
N_channel_array(:,4) = fix_channel4';
N_channel_array(:,5) = fix_channel5';
N_channel_array(:,6) = fix_channel6';
audiowrite('temporary2.wav',N_channel_array,48000);

str = ['killall python3'];
unix(str)
str2 = ['python3 play_8chn.py ' 'temporary2.wav' ' &'];
unix(str2)



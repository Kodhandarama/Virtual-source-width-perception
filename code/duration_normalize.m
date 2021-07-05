
filename = "new_diph/W6_AI_pitchchange_expt1.wav";
% filename1 = strcat("/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/expt_1_stimuli/loudness_normalization_done2/",filename);
% filename2 = strcat("/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/expt_1_stimuli/stimuli_duration_normalized/",filename);
fs = 48000;
t_length_rise_fall=(fs)/8;
tb = [0:t_length_rise_fall-1]/fs;
x = -5:10/length(tb):5-10/length(tb);
sigmoid_a = (1-tanh(x)) /2;
sigmoid_b = (1+tanh(x)) /2;
fd = sigmoid_a';
[soundchannels,Fs] = audioread(filename);


fix_channel1 = soundchannels(:,1);
fix_channel_slice1 = fix_channel1(1:158400);
fix_channel_slice1_ramp = fix_channel_slice1;
fix_channel_slice1_ramp(end-length(tb)+1:end) = fix_channel_slice1(end-length(tb)+1:end).* fd;

fix_channel2 = soundchannels(:,2);
fix_channel_slice2 = fix_channel2(1:158400);
fix_channel_slice2_ramp = fix_channel_slice2;
fix_channel_slice2_ramp(end-length(tb)+1:end) = fix_channel_slice2(end-length(tb)+1:end).* fd;

fix_channel3 = soundchannels(:,3);
fix_channel_slice3 = fix_channel3(1:158400);
fix_channel_slice3_ramp = fix_channel_slice3;
fix_channel_slice3_ramp(end-length(tb)+1:end) = fix_channel_slice3(end-length(tb)+1:end).* fd;

fix_channel4 = soundchannels(:,4);
fix_channel_slice4 = fix_channel1(1:158400);
fix_channel_slice4_ramp = fix_channel_slice4;
fix_channel_slice4_ramp(end-length(tb)+1:end) = fix_channel_slice4(end-length(tb)+1:end).* fd;

fix_channel5 = soundchannels(:,5);
fix_channel_slice5 = fix_channel5(1:158400);
fix_channel_slice5_ramp = fix_channel_slice5;
fix_channel_slice5_ramp(end-length(tb)+1:end) = fix_channel_slice5(end-length(tb)+1:end).* fd;

fix_channel6 = soundchannels(:,6);
fix_channel_slice6 = fix_channel6(1:158400);
fix_channel_slice6_ramp = fix_channel_slice6;
fix_channel_slice6_ramp(end-length(tb)+1:end) = fix_channel_slice6(end-length(tb)+1:end).* fd;

r = 48000 * 2;
r2= 48000 * 5;
delay = zeros(1,r);
delay2 = zeros(1,r2);
N_channel_1 = [delay, fix_channel_slice1_ramp',delay2];
N_channel_2 = [delay, fix_channel_slice2_ramp',delay2];
N_channel_3 = [delay, fix_channel_slice3_ramp',delay2];
N_channel_4 = [delay, fix_channel_slice4_ramp',delay2];
N_channel_5 = [delay, fix_channel_slice5_ramp',delay2];
N_channel_6 = [delay, fix_channel_slice6_ramp',delay2];
N_channel_array = zeros(494400,6);

N_channel_array(:,1) = N_channel_1';
N_channel_array(:,2) = N_channel_2';
N_channel_array(:,3) = N_channel_3';
N_channel_array(:,4) = N_channel_4';
N_channel_array(:,5) = N_channel_5';
N_channel_array(:,6) = N_channel_6';

% player = audioplayer(N_channel_3,fs);
% play(player);
real =5 ;
audiowrite(filename,N_channel_array,48000);
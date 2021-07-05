Files=dir('/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/expt_1_stimuli/loudness_calibration_needed');
fs_24 =24000;
fs_48= 48000;
load('/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/coeffs/ls1_comp.mat');
load('/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/coeffs/ls2_comp.mat');
load('/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/coeffs/ls3_comp.mat');
load('/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/coeffs/ls4_comp.mat');
load('/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/coeffs/ls5_comp.mat');
load('/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/coeffs/ls6_comp.mat');

for k=1:length(Files)
    FileNames=Files(k).name
    if(FileNames == '.') 
        a=5;
    else
%    
   [stimuli,Fs] = audioread(FileNames);
   N_channel_array = stimuli;
    x= N_channel_array(:,1);
    x =resample(x,fs_24,fs_48);
    x_ar = filter(a_ar1,1,x); 
    x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
    x_rs =resample(x_ar,fs_48,fs_24);
    b= fir1(100,12000/(fs_48/2));%12k lowpass
    x_rs_f = filter(b,1,x_rs); 
    N_channel_array(:,1) = x_rs_f;

    x= N_channel_array(:,2);
    x =resample(x,fs_24,fs_48);
    x_ar = filter(a_ar2,1,x); 
    x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
    x_rs =resample(x_ar,fs_48,fs_24);
    b= fir1(100,12000/(fs_48/2));%12k lowpass
    x_rs_f = filter(b,1,x_rs); 
    N_channel_array(:,2) = x_rs_f;


    x= N_channel_array(:,3);
    x =resample(x,fs_24,fs_48);
    x_ar = filter(a_ar3,1,x); 
    x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
    x_rs =resample(x_ar,fs_48,fs_24);
    b= fir1(100,12000/(fs_48/2));%12k lowpass
    x_rs_f = filter(b,1,x_rs); 
    N_channel_array(:,3) = x_rs_f;


    x= N_channel_array(:,4);
    x =resample(x,fs_24,fs_48);
    x_ar = filter(a_ar4,1,x); 
    x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
    x_rs =resample(x_ar,fs_48,fs_24);
    b= fir1(100,12000/(fs_48/2));%12k lowpass
    x_rs_f = filter(b,1,x_rs); 
    N_channel_array(:,4) = x_rs_f;


    x= N_channel_array(:,5);
    x =resample(x,fs_24,fs_48);
    x_ar = filter(a_ar5,1,x); 
    x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
    x_rs =resample(x_ar,fs_48,fs_24);
    b= fir1(100,12000/(fs_48/2));%12k lowpass
    x_rs_f = filter(b,1,x_rs); 
    N_channel_array(:,5) = x_rs_f;

    
    x= N_channel_array(:,6);
    x =resample(x,fs_24,fs_48);
    x_ar = filter(a_ar6,1,x); 
    x_n = 0.5*x_ar/max(abs(x_ar)); %+tion?
    x_rs =resample(x_ar,fs_48,fs_24);
    b= fir1(100,12000/(fs_48/2));%12k lowpass
    x_rs_f = filter(b,1,x_rs); 
    N_channel_array(:,6) = x_rs_f;
    
    place =strcat('/home/kodhandarama/Desktop/Desktop/Analog/Shreeram_Chandra/shreeram/python_work/python_sounddevice/Expt2/code/expt_1_stimuli/loudness_calibration_needed/done/',FileNames);
    audiowrite(place,N_channel_array,48000);
   
       
    end

   
   
end

sdsad=5;
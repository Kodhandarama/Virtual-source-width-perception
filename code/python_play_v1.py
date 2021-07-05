import sounddevice as sd
from scipy.io.wavfile import read
from scipy.io.wavfile import write
import numpy as np
import soundfile as sf
import sys
#sd.default.device = 7

#(fs1, x) = read('test_s.wav', 'rb')
#print fs1 #len(x)
#sd.play(x,fs1)
#sd.stop()

# python -m sounddevice
#fs = 16000
#duration = 10.5  # seconds
#myrecording = sd.rec(int(duration * fs), samplerate=fs, channels=1)
#print len(myrecording)
#write('temp.wav', fs, myrecording) 
#sd.play(myrecording)


data, fs = sf.read(sys.argv[1], dtype='float32')
#write('temp.wav', fs, data) 
#print len(data)
sd.default.channels = 6
myrecording = sd.playrec(data, fs, device = 6)
status = sd.wait()
#write('playrec_check4.wav', fs, myrecording) 


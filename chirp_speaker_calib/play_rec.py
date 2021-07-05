import sounddevice as sd
from scipy.io.wavfile import read
from scipy.io.wavfile import write
import numpy as np
import sys

device_out = 6 #maudio
device_in = 6 #earphone 

#sd.default.device = 6

#(fs1, x) = read(sys.argv[1], 'rb')
#print fs1 #len(x)
#sd.play(x,fs1)
#status = sd.wait()
#sd.stop()

#fs = 48000
#duration = 5  # seconds
#myrecording = sd.rec(int(duration * fs), samplerate=fs, channels=1)
#print 'recording ..'
#status = sd.wait()
#write(sys.argv[2], fs, myrecording) 
#print 'recording stopped'

#### 
#sd.play(myrecording)
#print 'playing ..'
#status = sd.wait()
#print 'end'
import soundfile as sf
data, fs = sf.read(sys.argv[1], dtype='float32')
#write('temp.wav', fs, data) 
print(len(data))
sd.default.channels = 2
myrecording = sd.playrec(data, fs, device=(device_in,device_out))
status = sd.wait()
write(sys.argv[2], fs, myrecording)

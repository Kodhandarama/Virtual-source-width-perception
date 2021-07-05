# Python program to play 8 channels
# Follows from /home/arthi/matlab/multichannel_audio/signal_play/playwav_v1.py
# Trouble is 32 bit 

import pyaudio
import wave
import sys
import scipy.io.wavfile
import math 
import numpy 

# length of data to read.
chunk = 1024

# open the file for reading.
wf = wave.open(sys.argv[1], 'rb')

# create an audio object
p = pyaudio.PyAudio()
chn = wf.getnchannels()

print(chn)

# open stream based on the wave object which has been input.
stream = p.open(format = p.get_format_from_width(wf.getsampwidth()),
                channels = wf.getnchannels(),
			#	output_device_index=6,
                rate = wf.getframerate(),
                output = True)
# print stream
# To get  device index: In python; import pyaudio; p = pyaudio.PyAudio(); print p.get_device_info_by_index(4).get('name')

# read data (based on the chunk size)
data = wf.readframes(chunk)

# play stream (looping from beginning of file to the end)
while data != '':
    # writing to the stream is what *actually* plays the sound.
    stream.write(data)
    data = wf.readframes(chunk)

# cleanup stuff.
stream.close()    
p.terminate()
wf.close()

for i=15:25
    
timesig =y(i,:);
plot(20*log10(abs(fft(timesig))))
axis([0 5500 -120 100])
hold on  
end
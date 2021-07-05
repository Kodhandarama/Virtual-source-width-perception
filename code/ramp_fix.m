function y_new = ramp_fix(y,fs,t_length_rise_fall)

    tb = [0:t_length_rise_fall-1]/fs;

    x = -5:10/length(tb):5-10/length(tb);

    sigmoid_a = (1-tanh(x)) /2;

    sigmoid_b = (1+tanh(x)) /2;

    y_new = y;

    y_new(1:length(tb)) = y(1:length(tb)).*sigmoid_b;

    y_new(end-length(tb)+1:end) = y(end-length(tb)+1:end).*sigmoid_a;

end
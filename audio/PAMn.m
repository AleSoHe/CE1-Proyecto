load('Chihiro.mat');

%Plot Message (Channel 1)
in = 1:20000;
x1 = Burn(in, 1);

x2 = x1.*clk(1:20000);

in = in/Fs;
figure(1), plot(in, x1)

%Plot Pulse Amplitude Modulated signal
figure(2), plot(in, x2)
close all
clear all
clc

disp('1. Tono')
disp('2. Canción')
select = input('Seleccione la señal de entrada: ');

if select == 1
    %Time specifications:
    Fs = 8000; %Samples per second
    dt = 1/Fs; %Seconds per sample
    StopTime = 0.25; %Seconds
    t1 = (0:dt:StopTime-dt)'; %Seconds

    %Generate sine wave:
    Fc = 60; %Hertz
    x = cos(2*pi*Fc*t1);

    %Plot the signal versus time:
    figure(1)
    hold on
    plot(t1,x)

elseif select == 2
    [y,Fs] = audioread('test.mp3'); %Load song
    
    dt = 1/Fs; %Seconds per sample
    StopTime = 1; %Seconds
    t1 = (0:dt:StopTime-dt)'; %Seconds
    
    x = y(1:Fs*StopTime,1); %Cut song to desired length
    
    %Plot the signal versus time:
    figure(1)
    hold on
    plot(t1,x)
    
end

pulse_w_factor = 2; %This value will divide the pulse sample period to 
                    %achieve a variety of pulse widths. Use values greater 
                    %than 1.
pulse_samp_freq = 10000;
                    
ft_mod(x,Fs,pulse_samp_freq,pulse_w_factor);

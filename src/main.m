close all
%clear all
clc

% Choose signal
[signal, Fs, BW, t] = choose_signal();

pulse_w_factor = 0.5; %This value will divide the pulse sample period to 
                      %achieve a variety of pulse widths. Use values greater 
                      %than 3
pulse_samp_freq = 20*BW;

% -------------------
% FLAT TOP MODULATION
% -------------------m   

% Flat Top Modulation
mod_sig_ft = ft_mod(signal, Fs, pulse_samp_freq, pulse_w_factor, t);

% Channel
mod_sig_ft_noise = channel(t, mod_sig_ft,15,1);

% Demodulation
demod_sig_ft_noise = demod(mod_sig_ft_noise, BW, Fs);
demod_sig_ft = demod(mod_sig_ft, BW, Fs);

% Equalizer
equalized_sig_ft_noise = equalizer(demod_sig_ft_noise, Fs, BW);
equialized_sig_ft = equalizer(demod_sig_ft, Fs, BW);

% Play signal
sound(demod_sig_ft,Fs);

metrics(signal,demod_sig_ft,demod_noise_ft);

% ------------------
% NATURAL MODULATION
% ------------------

%Natural PAM Modulation
mod_sig_nat = n_mod2(signal, Fs, pulse_samp_freq, pulse_w_factor, t);

%Channel
mod_sig_nat_noise = channel(t, mod_sig_nat,15,1);

%Demodulation
demod_sig_nat_noise = demod(mod_sig_nat_noise, BW, Fs);
demod_sig_nat = demod(mod_sig_nat, BW, Fs);

%Play signal
sound(demod_sig_nat,Fs);

% ---------
% FUNCTIONS
% ---------

% Choose signal function (sine or audio)
function [signal,Fs,BW,t] = choose_signal()
    disp('1. Tono')
    disp('2. Canción')
    select = input('Seleccione la señal de entrada: ');

    if select == 1
        %Time specifications:
        Fs = 8000; %Samples per second
        dt = 1/Fs; %Seconds per sample
        StopTime = 0.1; %Seconds
        t = (0:dt:StopTime-dt)'; %Seconds

        %Generate sine wave:
        Fc = 60; %Hertz
        signal = cos(2*pi*Fc*t);
        BW = Fc; %Send Bandwidth for demod
        
        %Plot the signal versus time:
        figure(1)
        hold on
        plot(t,signal)

    elseif select == 2
        [y,Fs] = audioread('..\audio\Clip.wav'); %Load song

        dt = 1/Fs; %Seconds per sample
        StopTime = 1; %Seconds
        t = (0:dt:StopTime-dt)'; %Seconds

        signal = y(1:Fs*StopTime,1); %Cut song to desired length
        BW = 20000; %Send Bandwidth for demod (audible frequencies)
        
        %Plot the signal versus time:
        figure(1)
        hold on
        plot(t,signal)
    end
end
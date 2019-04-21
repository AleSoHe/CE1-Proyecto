function output = equalizer(input, Fs, BW)

% This function receives an "input" signal, of bandwidth "BW", sampled with
% a "Fs" frequency.
% The input signal is processed by an equalizer (1/sa), and the result is
% the "output" of the function

% Load piano.mp3, for testing purposes
[input,Fs] = audioread('..\audio\piano.mp3');

% Signal resampling
n = 20;
input = resample(input,1,n);
Fs = Fs/n;

% Compute normialized cutoff frequency
norm_cutoff = BW/Fs;

% Filter design
d = fdesign.isinclp('N,Fp,Fst',50,norm_cutoff,norm_cutoff+0.1);
Hd = design(d,'SincFrequencyFactor',0.5,'SincPower',4,'SystemObject',true);
fvtool(Hd, 'MagnitudeDisplay', 'Magnitude');

% Signal equalization
output = Hd(input);

% Play music
sound(output,Fs);



%Load File
[y, Fs] = audioread('Burn My Dread.wav');

%Select 10 second clip
y = y(850001:1291000, :);

%Oversampling by A
A = 50;

len = A*441000;
Burn = zeros(len,2);

for i = A:(len + A-1)
    Burn(i-A+1, :) = y(floor(i/A), :);
end

Fs = Fs*A;

%Pulse Signal
clk = zeros(len, 1);

for i = 1:4*A:len
    clk(i:i+2*A-1) = ones(2*A, 1);
end

%Clear variables
clear A i len

%Save into data file
save('Chihiro.mat');